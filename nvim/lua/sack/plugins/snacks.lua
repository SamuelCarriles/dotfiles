return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
      git_status = true,
      diagnostics = true,
      trash = true,
    },
    bufdelete = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    quickfile = { enabled = true },
    lazygit = { enabled = true },
    dashboard = { enabled = true },
    terminal = { enabled = true },
    -- scope = { enabled = true },
    rename = { enabled = true },
    notifier = { enabled = true },
  },
  keys = {
    -- Archivos y texto
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Buscar Archivos" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Buscar Texto en el proyecto" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buscar en Buffers abiertos" },

    -- Configuración y ayuda de neovim
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Buscar en la Ayuda (:help)" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Buscar Atajos de Teclado" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Buscar en Config de Neovim" },

    -- Historial y búsqueda rápida
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Archivos Recientes" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Cambiar Tema Visual" },
    { "<leader>e", function() Snacks.explorer() end, desc = "Abrir el explorador de archivos" },
  
    -- Herramientas integradas
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Abrir LazyGit" },
    { "<leader>tt", function() Snacks.terminal() end, desc = "Terminal flotante" },

    -- Bufdelete
    { "<leader>D", function() Snacks.bufdelete() end, desc = "Borrar búfer actual" },
    { "<leader>Do", function() Snacks.bufdelete.others() end, desc = "Borrar todos lus búfers excepto el actual" },
    
    -- Rename
    {"<leader>cr", function() Snacks.rename.rename_file() end, desc = "Renombrar" },
  },
}
