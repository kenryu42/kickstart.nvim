return {
  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',
  opts = {},
  config = function(_, opts)
    -- PATCH: Neovim 0.12+ changed vim.treesitter.get_parser() to return nil
    -- instead of throwing an error when no parser is found.
    -- Comment.nvim only checks pcall success (ok), not nil, so it crashes
    -- with "attempt to index local 'tree' (a nil value)" for filetypes
    -- without a treesitter parser installed.
    -- See: https://github.com/neovim/neovim/pull/30313
    -- TODO: Remove this patch once Comment.nvim updates ft.calculate upstream.
    local ft = require 'Comment.ft'
    local A = vim.api

    if not ft._patched_for_nvim_012 then
      local original = ft.calculate
      ft.calculate = function(ctx)
        local ok, parser = pcall(vim.treesitter.get_parser, A.nvim_get_current_buf())
        if not ok or not parser then
          return ft.get(vim.bo.filetype, ctx.ctype) --[[ @as string ]]
        end
        return original(ctx)
      end
      ft._patched_for_nvim_012 = true
    end

    require('Comment').setup(opts)
  end,
}
