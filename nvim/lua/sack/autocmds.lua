local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local sack_group = augroup("SackGroup", { clear = true })

autocmd("TextYankPost", {
	group = sack_group,
	desc = "Resaltar texto copiado",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
