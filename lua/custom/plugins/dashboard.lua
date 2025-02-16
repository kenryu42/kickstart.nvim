return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        center = {
          {
            desc = '',
          },
        },
      },
      hide = {
        statusline = false,
      },
      preview = {
        command = 'lolcat',
        file_path = '~/.config/nvim/dashboard/420024.txt',
        file_width = 60,
        file_height = 12,
      },
      -- preview = {
      --   command = 'lolcat',
      --   file_path = '~/.config/nvim/dashboard/make_cool_stuff.txt',
      --   file_width = 42,
      --   file_height = 36,
      -- },
      -- preview = {
      --   command = 'lolcat',
      --   file_path = '~/.config/nvim/dashboard/sexy.txt',
      --   file_width = 60,
      --   file_height = 43,
      -- },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
