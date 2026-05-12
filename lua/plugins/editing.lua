local quote_chars = {
  ['"'] = true,
  ["'"] = true,
  ["`"] = true,
}

local function is_escaped(line, index)
  local backslash_count = 0

  for i = index - 1, 1, -1 do
    if line:sub(i, i) ~= "\\" then
      break
    end
    backslash_count = backslash_count + 1
  end

  return backslash_count % 2 == 1
end

local function collect_quote_pairs(line)
  local open_positions = {}
  local pairs = {}

  for i = 1, #line do
    local char = line:sub(i, i)

    if quote_chars[char] and not is_escaped(line, i) then
      if open_positions[char] then
        table.insert(pairs, {
          left = open_positions[char],
          right = i,
          width = i - open_positions[char],
        })
        open_positions[char] = nil
      else
        open_positions[char] = i
      end
    end
  end

  return pairs
end

local function get_pair_score(pair, cursor_col)
  local covers_cursor = pair.left <= cursor_col and cursor_col <= pair.right
  local distance = 0

  if not covers_cursor then
    if cursor_col < pair.left then
      distance = pair.left - cursor_col
    else
      distance = cursor_col - pair.right
    end
  end

  return {
    covers_cursor = covers_cursor,
    distance = distance,
    width = pair.width,
    left = pair.left,
  }
end

local function is_better_pair(candidate, current, cursor_col)
  if not current then
    return true
  end

  local candidate_score = get_pair_score(candidate, cursor_col)
  local current_score = get_pair_score(current, cursor_col)

  if candidate_score.covers_cursor ~= current_score.covers_cursor then
    return candidate_score.covers_cursor
  end

  if candidate_score.distance ~= current_score.distance then
    return candidate_score.distance < current_score.distance
  end

  if candidate_score.width ~= current_score.width then
    return candidate_score.width < current_score.width
  end

  return candidate_score.left < current_score.left
end

local function find_nearest_quote_pair(line, cursor_col)
  local best_pair

  for _, pair in ipairs(collect_quote_pairs(line)) do
    if is_better_pair(pair, best_pair, cursor_col) then
      best_pair = pair
    end
  end

  return best_pair
end

local function make_quote_textobject(ai_type)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line_number = cursor[1]
  local cursor_col = cursor[2] + 1
  local pair = find_nearest_quote_pair(vim.api.nvim_get_current_line(), cursor_col)

  if not pair then
    return nil
  end

  if ai_type == "a" then
    return {
      from = { line = line_number, col = pair.left },
      to = { line = line_number, col = pair.right },
      vis_mode = "v",
    }
  end

  local from_col = pair.left + 1
  local to_col = pair.right - 1

  if from_col > to_col then
    return {
      from = { line = line_number, col = from_col },
      vis_mode = "v",
    }
  end

  return {
    from = { line = line_number, col = from_col },
    to = { line = line_number, col = to_col },
    vis_mode = "v",
  }
end

return {
  {
    "rainbowhxch/accelerated-jk.nvim",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    event = "VeryLazy",
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    keys = {
      { "ii", "iz", mode = { "x", "o" }, remap = true, desc = "Inside nearest quotes" },
      { "aa", "az", mode = { "x", "o" }, remap = true, desc = "Around nearest quotes" },
    },
    opts = function(_, opts)
      opts.custom_textobjects = opts.custom_textobjects or {}
      opts.custom_textobjects.z = function(ai_type)
        return make_quote_textobject(ai_type)
      end

      return opts
    end,
  },

  {
    "kosayoda/nvim-lightbulb",
  },

  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "folke/snacks.nvim",
        opts = {
          terminal = {},
        },
      },
    },
    event = "LspAttach",
    keys = {
      {
        "<leader>ca",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          if vim.api.nvim_buf_is_valid(bufnr) then
            require("tiny-code-action").code_action()
          else
            print("Invalid buffer!")
          end
        end,
        desc = "Code Action",
      },
    },
    opts = {},
  },

  { "wakatime/vim-wakatime", lazy = false },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- 启用默认快捷键
        default_commands = true, -- 启用命令
        disable_diagnostics = false,
        highlights = {
          incoming = "DiffAdd", -- 对方分支的改动高亮
          current = "DiffText", -- 当前分支的改动高亮
        },
      })
    end,
  },
}
