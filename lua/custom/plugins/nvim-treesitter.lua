return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    install_dir = vim.fn.stdpath 'data' .. '/lazy/nvim-treesitter',
    ensure_installed = { 'bash', 'c', 'css', 'diff', 'dockerfile', 'go', 'html', 'javascript', 'json', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'regex', 'rust', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml', 'jsdoc', 'gitcommit' },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    local ts = require 'nvim-treesitter'

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ts.setup { install_dir = opts.install_dir }

    local installed = ts.get_installed 'parsers'
    local missing = vim.tbl_filter(function(lang)
      return not vim.list_contains(installed, lang)
    end, opts.ensure_installed)

    if #missing > 0 then
      ts.install(missing)
    end

    local group = vim.api.nvim_create_augroup('kickstart-treesitter', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        if opts.indent.enable and not vim.list_contains(opts.indent.disable, vim.bo[args.buf].filetype) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
