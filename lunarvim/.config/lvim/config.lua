-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- general configs
lvim.format_on_save.enabled = false

-- Key Mappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>a"
lvim.keys.normal_mode["<C-d>"] = "Yp"
lvim.keys.normal_mode["<C-a>"] = "<Esc>ggVG"
lvim.builtin.terminal.open_mapping = "<C-t>"

-- Move line up/down --
lvim.keys.normal_mode['<C-S-Down>'] = "<Esc>v:move '>+1<CR>gv-gv<Esc>"
lvim.keys.normal_mode['<C-S-Up>'] = "<Esc>v:move '<-2<CR>gv-gv<Esc>"
lvim.keys.normal_mode['<C-J>'] = "<Esc>v:move '>+1<CR>gv-gv"
lvim.keys.normal_mode['<C-K>'] = "<Esc>v:move '<-2<CR>gv-gv"

lvim.keys.visual_block_mode['<C-J>'] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_block_mode['<C-K>'] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_block_mode['<C-S-Down>'] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_block_mode['<C-S-Up>'] = ":move '<-2<CR>gv-gv"

-- Custom Key Bindings for Plugins
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }

-- LunarVim Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  "wakatime/vim-wakatime",
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "tanvirtin/monokai.nvim"
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
}
