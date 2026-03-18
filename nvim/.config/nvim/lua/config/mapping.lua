local M = {}
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.expand("%:p") ~= "" then
      vim.cmd("cd %:p:h")
    end
  end,
})
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })

-- ───────────────────────────────
-- Simple Buffer Navigation
-- ───────────────────────────────

-- Navigate buffers
vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<CR>')  -- Previous buffer
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<CR>')      -- Next buffer

        vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true
