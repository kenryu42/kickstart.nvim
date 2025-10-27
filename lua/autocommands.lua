--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('Update', function()
  require('lazy').update()
end, {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'OilEnter',
  callback = vim.schedule_wrap(function(args)
    local oil = require 'oil'
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.open_preview()
    end
  end),
})

vim.api.nvim_create_user_command('Error', function()
  vim.diagnostic.setqflist()
end, {})

vim.api.nvim_create_user_command('Chat', 'call codeium#Chat()', {})

vim.api.nvim_create_user_command('LineCount', function()
  vim.cmd 's/./&/gn'
end, {})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.cpp',
  callback = function()
    local template = vim.fn.expand '~/.config/nvim/templates/atcoder.cpp'
    if vim.fn.filereadable(template) == 1 and vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      vim.cmd('0r ' .. template)
    end
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.cpp',
  callback = function()
    if vim.fn.line '$' == 1 and vim.fn.getline(1) == '' then
      local template = vim.fn.expand '~/.config/nvim/templates/atcoder.cpp'
      if vim.fn.filereadable(template) == 1 then
        vim.cmd('0r ' .. template)
      end
    end
  end,
})

-- vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
--   pattern = '*',
--   command = 'checktime',
-- })
