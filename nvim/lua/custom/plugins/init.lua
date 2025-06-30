-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      local ts_utils = require 'nvim-lsp-ts-utils'
      ts_utils.setup {
        enable_import_on_completion = true,
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == 'tsserver' then
            ts_utils.setup_client(client)
          end
        end,
      })
    end,
  },
}
