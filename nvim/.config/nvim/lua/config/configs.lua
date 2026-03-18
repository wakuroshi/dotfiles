vim.opt.number = true
vim.opt.relativenumber = true
vim.o.list = true
vim.o.listchars = 'tab:» ,lead:•,trail:•'
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
	vim.opt_local.tabstop = 2
	vim.opt_local.shiftwidth = 2
	end,
})
vim.opt.expandtab = false
vim.opt_local.tabstop = 8
vim.opt_local.shiftwidth = 8
vim.opt.smartindent = true
