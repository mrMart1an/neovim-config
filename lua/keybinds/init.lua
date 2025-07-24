-- clear highlighting 
vim.keymap.set('n', '<leader>hh', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- exit insert mode keybinds
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<ESC>', { desc = 'Exit insert mode' })

-- cycle buffer
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { desc = 'Move to previus buffer'})
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { desc = 'Move to next buffer'})

-- save all
vim.keymap.set('n', '<C-s>', ':wa<CR>', { desc = 'Save all changes'})
vim.keymap.set('i', '<C-s>', ':wa<CR>', { desc = 'Save all changes'})
vim.keymap.set('v', '<C-s>', ':wa<CR>', { desc = 'Save all changes'})

-- toggle nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree'})

-- toggle line wrap
vim.keymap.set('n', '<leader>lw', ':set wrap!<CR>', { desc = 'Toggle line wraping'})

-- Format the buffer using the LSP
vim.keymap.set('n', '<leader>lfb', vim.lsp.buf.format, { desc = 'Format the buffer with the LSP formatter' })

-- Fix extremely annoying issue with tab 
function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])
