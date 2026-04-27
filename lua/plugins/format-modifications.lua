return {
  {
    "joechrisellis/lsp-format-modifications.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      -- 创建用户命令：手动格式化修改的部分
      vim.api.nvim_create_user_command("FormatModifications", function()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients > 0 then
          require("lsp-format-modifications").format_modifications(clients[1], 0)
        else
          vim.notify("No LSP client attached", vim.log.levels.WARN)
        end
      end, { desc = "Format only modified lines" })

      -- 保存时自动格式化修改的部分
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("FormatModifications", { clear = true }),
        callback = function()
          local clients = vim.lsp.get_active_clients({ bufnr = 0 })
          if #clients > 0 then
            -- 插件内部会自动检查文件是否在 git 仓库中、是否有修改
            pcall(function()
              require("lsp-format-modifications").format_modifications(clients[1], 0)
            end)
          end
        end,
      })
    end,
  },
}
