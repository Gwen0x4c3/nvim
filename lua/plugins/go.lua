return {
  -- Go 语言支持 - 使用 trae-gopls 优化版
  -- 参考文档: https://bytedance.larkoffice.com/wiki/RvEAwHc22i7L94kSCEZcn6dhnyd
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          -- 使用 trae-gopls 替代官方 gopls，大幅降低内存占用
          cmd = { "trae-gopls" },
          settings = {
            gopls = {
              analyses = {
                shadow = true,
              },
              -- 默认只分析 workspace package 和标准库
              -- 如需分析所有依赖，设置为 "all"（会增加内存使用）
              -- analysisScope = "workspace",
              semanticTokens = true,
            },
          },
        },
      },
    },
  },
}
