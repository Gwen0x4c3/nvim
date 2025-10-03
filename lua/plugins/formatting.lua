-- 格式化配置：支持只格式化修改的行
-- 与 LazyVim 的格式化系统集成
-- 使用 format + selective apply 的方式，只保留修改行的格式化结果

return {
  -- Keymap to trigger DiffFormat (format only changed lines)
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>cf", "<cmd>DiffFormat<cr>", desc = "Format git changed lines", mode = { "n", "v" } },
    },
  },
  -- Integrate with LazyVim's formatting on save
  {
    "LazyVim/LazyVim",
    opts = {
      formatting = {
        -- Use our diff-based formatting on save when enabled
        format_on_save = function(bufnr)
          if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
            return
          end

          local use_changed_only = vim.b[bufnr].format_only_changed_lines
          if use_changed_only == nil then
            use_changed_only = vim.g.format_only_changed_lines
          end

          if use_changed_only then
            local ok_conform, conform = pcall(require, "conform")
            local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
            if not ok_conform or not ok_gitsigns then
              return { lsp_fallback = true }
            end

            local hunks = gitsigns.get_hunks()
            if hunks and #hunks > 0 then
              for i = #hunks, 1, -1 do
                local hunk = hunks[i]
                if hunk and hunk.type ~= "delete" then
                  local start = hunk.added.start
                  local last = start + hunk.added.count
                  local last_line = vim.api.nvim_buf_get_lines(bufnr, last - 2, last - 1, true)[1] or ""
                  local range = { start = { start, 0 }, ["end"] = { last - 1, #last_line } }
                  conform.format({ bufnr = bufnr, range = range, lsp_fallback = true })
                end
              end
              -- We've already formatted by ranges; returning nil prevents whole-file format
              return
            end
            -- No hunks (new file / not in git); fall back to whole-file
            return { lsp_fallback = true }
          end

          -- Default: whole-file format
          return { lsp_fallback = true }
        end,
      },
    },
  },
}
