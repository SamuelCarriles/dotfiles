return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  dependencies = "nvim-mini/mini.icons",
  priority = 850,
  config = function()
    require("bufferline").setup {
      options = {
        separator_style = "slope",
        diagnostics = "nvim_lsp",
      },
    }
  end,
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Pestaña anterior" },
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Pestaña siguiente" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Fijar/Desfijar pestaña" },
  },
}

