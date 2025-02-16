-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Personal preference
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Oil keymaps
-- Open parent directory in current window
set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Open parent directory in floating window
set('n', '<space>-', require('oil').toggle_float, { desc = 'Open parent directory in floating window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- set('n', '<c-k>', ':wincmd k<CR>')
-- set('n', '<c-j>', ':wincmd j<CR>')
-- set('n', '<c-h>', ':wincmd h<CR>')
-- set('n', '<c-l>', ':wincmd l<CR>')

-- NeoTree keymaps
set('n', '<leader>n', ':Neotree toggle<CR>', { desc = 'Toggle [N]eoTree' })

-- thse mappings control the size of splits (height/width)
set('n', '<C-,>', '<c-w>5>')
set('n', '<C-.>', '<c-w>5<')
set('n', '<C-t>', '<C-W>+')
set('n', '<C-s>', '<C-W>-')
