-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'JanosSarkoezi/blame.nvim',
    opts = {
      blame_options = { '-w' },
      colors = { '#A587CA', '#36CEDC', '#8FE968', '#FFEA56', '#FFB750', '#FE797B' },
    },
    init = function()
      vim.keymap.set('n', '<leader>b', ':BlameToggle<CR>', { desc = 'Toggle [B]lame' })
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
    end,
  },
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
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
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
