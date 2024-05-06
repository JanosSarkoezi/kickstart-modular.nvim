-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'christoomey/vim-tmux-navigator',
    config = function()
      local key_map = vim.api.nvim_set_keymap

      key_map('n', '<M-Left>', [[<cmd>TmuxNavigateLeft<CR>]], { noremap = true, silent = true })
      key_map('n', '<M-Right>', [[<cmd>TmuxNavigateRight<CR>]], { noremap = true, silent = true })
      key_map('n', '<M-Up>', [[<cmd>TmuxNavigateUp<CR>]], { noremap = true, silent = true })
      key_map('n', '<M-Down>', [[<cmd>TmuxNavigateDown<CR>]], { noremap = true, silent = true })
    end,
  },
  {
    'ggandor/leap.nvim',
    init = function()
      require('leap').create_default_mappings()
    end,
    lazy = false,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
    },
    config = true,
  },
  {
    'jpalardy/vim-slime',
    init = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_python_ipython = 1
      vim.g.slime_bracketed_paste = 1
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- {
  --   'rcarriga/nvim-notify',
  --   init = function()
  --     -- vim.g.have_nerd_font = true
  --     vim.opt.termguicolors = true
  --     vim.notify = require 'notify'
  --   end,
  -- },

  {
    'echasnovski/mini.notify',
    init = function()
      local notify = require 'mini.notify'
      notify.setup()
      vim.notify = notify.make_notify {
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      }
    end,
  },
}
