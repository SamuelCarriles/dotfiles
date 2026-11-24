return {
  "nvim-mini/mini.ai",
  version = "*",
  lazy = false,
  config = function()
    require("mini.ai").setup {
      n_lines = 500,
    }
  end,
}
