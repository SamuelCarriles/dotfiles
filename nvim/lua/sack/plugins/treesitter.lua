return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({})
		ts.install({
			"clojure",
			"lua",
			"nix",
			"bash",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
			"tsx",
			"typescript",
			"javascript",
			"html",
			"css",
			"json",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("SackTreesitter", { clear = true }),
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
