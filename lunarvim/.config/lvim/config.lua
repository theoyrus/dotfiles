-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
-- lvim.colorscheme = "spacegray"
lvim.colorscheme = "monokai"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<cr>a"
lvim.keys.normal_mode["<C-d>"] = "Yp"
lvim.keys.normal_mode["<C-a>"] = "<Esc>ggVG"
lvim.keys.insert_mode["<F1>"] = "<Del>"
lvim.keys.normal_mode["<F1>"] = "<Del>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Python
-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
    args = {},
  },
}

-- JavaScript
-- exe value can be "prettier", "prettierd", "eslint", or "eslint_d"
-- lvim.lang.javascript.formatters = { { exe = "prettier" } }
-- lvim.lang.javascript.formatters = { { exe = "eslint" }, { exe = "prettier" } }
-- lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters

-- GoLang -- exe value can be "gofmt", "goimports", or "gofumpt"
lvim.lang.go.formatters = { { exe = "goimports" } }
-- require("lspconfig").gopls.setup({
-- 	cmd = { "gopls", "serve" },
-- 	settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
-- 	root_dir = require("lspconfig").util.root_pattern(".git", "go.mod", "."),
-- 	init_options = { usePlaceholders = true, completeUnimported = true },
-- 	on_attach = require("lsp").common_on_attach,
-- })

-- lvim.lang.go.lsp.setup = {
-- 	cmd = { "gopls", "serve" },
-- 	filetype = { "go", "gomod" },
-- 	settings = {
-- 		gopls = {
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 		},
-- 	},
-- }

-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }
lvim.lang.lua.formatters = { { exe = "stylua" } }

-- Additional Plugins
lvim.plugins = {
  --     {"folke/tokyonight.nvim"}, {
  --         "ray-x/lsp_signature.nvim",
  --         config = function() require"lsp_signature".on_attach() end,
  --         event = "InsertEnter"
  --     },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "tanvirtin/monokai.nvim",
  },
  {
    "folke/persistence.nvim",
    event = "VimEnter",
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "sheerun/vim-polyglot",
  },
  {
    "editorconfig/editorconfig-vim",
  },
  -- {
  -- 	"fatih/vim-go",
  -- },
}

-- persistence pluggin keybindings
-- lvim.builtin.which_key.mappings["Q"] = {
-- 	name = "+Quit",
-- 	s = { "<cmd>lua require('persistence').load()<cr>", "Restore for current dir" },
-- 	l = { "<cmd>lua require('persistence').load(last=true)<cr>", "Restore last session" },
-- 	d = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
