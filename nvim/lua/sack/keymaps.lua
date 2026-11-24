local keym = vim.keymap

keym.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Limpiar reslatado de búsqueda" })
keym.set("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
keym.set("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana de abajo" })
keym.set("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana de arriba" })
keym.set("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })
keym.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea seleccionada abajo" })
keym.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea seleccionada arriba" })
keym.set("v", "<", "<gv", { desc = "Indentar a la izquierda y re-seleccionar" })
keym.set("v", ">", ">gv", { desc = "Indentar a la derecha y re-seleccionar" })
keym.set({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "Guardar archivo" })
keym.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Cerrar ventana" })
