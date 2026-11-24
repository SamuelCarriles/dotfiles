return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●",
			},
			underline = true,
			signs = true,
			update_in_insert = true,
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("SackLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				local keym = vim.keymap

				opts.desc = "Ir a la definición"
				keym.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Ver documentación"
				keym.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Acciones de código"
				keym.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Renombrar símbolo"
				keym.set("n", "<leader>rs", vim.lsp.buf.rename, opts)
			end,
		})
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("nil_ls", {
			capabilities = capabilities,
			settings = {
				["nil"] = {
					nix = {
						flake = {
							autoArchive = true,
							autoEvalInputs = true,
						},
					},
				},
			},
		})
		vim.lsp.config("clojure_lsp", {
			capabilities = capabilities,
		})
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("clojure_lsp")
	end,
}
