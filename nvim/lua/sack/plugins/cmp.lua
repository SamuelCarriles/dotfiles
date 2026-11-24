return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		--{ "saghen/blink.compat", version = "2.*", lazy = true, opts = {} },
		--{ "PaterJason/cmp-conjure", lazy = true },
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- per_filetype = {
			-- clojure = { inherit_defaults = true, "conjure" },
			-- },
			-- providers = {
			-- conjure = { name = "conjure", module = "blink.compat.source" },
			-- },
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = { enabled = true },
	},

	opts_extend = { "sources.default" },
}
