return {
  "nvim-mini/mini.icons",
  version = "*",
  lazy = false,
  priority = 1000,
  config = function()
    local icons = require("mini.icons")
    icons.setup()
    icons.mock_nvim_web_devicons()
  end,
}
