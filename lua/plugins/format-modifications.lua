return {
  {
    "joechrisellis/lsp-format-modifications.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      -- 创建用户命令：手动格式化修改的部分
      -- vim.api.nvim_create_user_command("FormatModifications", function()
      --   local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      --   if #clients == 0 then
      --     vim.notify("No LSP client attached", vim.log.levels.WARN)
      --     return
      --   end
      --
      --   -- 检查文件是否在 git 仓库中
      --   local filepath = vim.fn.expand("%:p")
      --   local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(vim.fn.fnamemodify(filepath, ":h")) .. " rev-parse --show-toplevel 2>/dev/null")
      --   if vim.v.shell_error ~= 0 or #git_root == 0 then
      --     vim.notify("File not in git repository, skipping diff format", vim.log.levels.INFO)
      --     return
      --   end
      --
      --   local ok, err = pcall(function()
      --     require("lsp-format-modifications").format_modifications(clients[1], 0)
      --   end)
      --   if not ok then
      --     -- 如果失败，回退到普通格式化
      --     vim.notify("Diff format failed, using full format", vim.log.levels.WARN)
      --     vim.lsp.buf.format({ bufnr = 0 })
      --   end
      -- end, { desc = "Format only modified lines" })
      --
      -- -- 保存时自动格式化修改的部分
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = vim.api.nvim_create_augroup("FormatModifications", { clear = true }),
      --   callback = function()
      --     local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      --     if #clients == 0 then
      --       return
      --     end
      --
      --     -- 检查文件是否在 git 仓库中
      --     local filepath = vim.fn.expand("%:p")
      --     local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(vim.fn.fnamemodify(filepath, ":h")) .. " rev-parse --show-toplevel 2>/dev/null")
      --     if vim.v.shell_error ~= 0 or #git_root == 0 then
      --       return
      --     end
      --
      --     -- 尝试使用 diff format，失败则跳过
      --     pcall(function()
      --       require("lsp-format-modifications").format_modifications(clients[1], 0)
      --     end)
      --   end,
      -- })
    end,
  },
}
