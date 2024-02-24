-- GOOD TRICKS!
-- select block, then '=' to indent
-- 's' to sneak
-- 'zz' to recenter page on cursor

------------
-- BASIC CONFIG
------------

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.ts = 3
vim.opt.shiftwidth = 3
vim.opt.encoding = "utf8"
vim.opt.termguicolors = true

vim.opt.compatible = false						-- don't be compatible with vi
vim.opt.number = true 							-- show line number

vim.opt.shell = "/bin/zsh"
vim.opt.mouse = "a"								-- enable mouse
vim.opt.clipboard:append("unnamedplus")	-- share copy/paste with OS
vim.opt.hidden = true 							-- allow multiple buffers to be edited at once

-- search stuff
vim.opt.ignorecase = true 						-- lowercase searches aren't case-sensitive
vim.opt.smartcase = true 						-- searches with capital letters are case-sensitive

-- turn off swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false

-- vim's default split positions are bizarre
vim.opt.splitbelow = true
vim.opt.splitright = true

-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- enhanced command-line completion
vim.opt.wildchar = ("\t"):byte()
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- code folding
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "3"
vim.opt.foldnestmax = 10
vim.opt.foldlevelstart = 99

-- disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- @TODO terminal stuff?

------------
-- PLUGINS
------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- general stuff
	"mhinz/vim-startify",       -- start page
	"gbprod/cutlass.nvim",      -- cut/delete
	"github/copilot.vim",       -- github copilot

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function() require("nvim-surround").setup() end
	},

	-- @TODO learn how to use this
	 { "lewis6991/gitsigns.nvim", init = function() require('gitsigns').setup() end },

	-- remove unused buffers
	{ "echasnovski/mini.nvim", init = function() require('mini.bufremove').setup() end },

	-- block comments
	{ "numToStr/Comment.nvim", lazy = false, init = function() require('Comment').setup() end },

	-- leap with 's'
	{ "ggandor/leap.nvim", init = function() require("leap").create_default_mappings()  end },

	-- leader + wait = keybinding reminders
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
		require("which-key").setup()
		 vim.o.timeout = true
		 vim.o.timeoutlen = 300
	  end
	},

	-- replacement for vim-vinegar
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { silent = true, desc = "Open parent directory" })
		end
	},

	-- buffer status line
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			require("bufferline").setup({
				options = { }
			})
		end
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			require("nvim-treesitter.configs").setup({
				-- required
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"json",
					"php",
					"html",
					"regex",
					"sql",
					"yaml",
					"markdown",
				 },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	-- telescope - replacement for FZF, etc
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter"
		},
		init = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							-- escape closes telescope
							["<esc>"] = actions.close
						},
					},
				}
			})
			require("telescope").load_extension("notify")
		end
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	},

	-- status line
	-- @TODO integrate with noice?
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("lualine").setup({
				-- options = {
				-- 	theme = "jellyx",
				-- },
			})
		end
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "fade_in_slide_out",
				timeout = 2000, -- @TODO
				render = "compact",
			})
			vim.notify = require("notify")
		end
	},

	--  nice command line
	-- @TODO figure out how to configure this
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify", -- top right notification window - annoying
			"nvim-treesitter/nvim-treesitter"
		}
	},

	-- window picker
	-- regular vimscript since there's no good lua alternative :(
	"t9md/vim-choosewin",

	-- LSP
	-- @TODO review/clean this
	{
		"williamboman/mason.nvim",
		lazy = false,
		init = function()
			require("mason").setup()
		end
	},
	"L3MON4D3/LuaSnip",
	{
		"hrsh7th/nvim-cmp",
		init = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"neovim/nvim-lspconfig",
		init = function()
			local lspconfig = require("lspconfig")
			local caps = vim.lsp.protocol.make_client_capabilities()
			local no_format = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
			end

			-- Capabilities
			caps.textDocument.completion.completionItem.snippetSupport = true

			-- see installed servers with :Mason

			-- Python
			lspconfig.pyright.setup({
			  capabilities = caps,
			  on_attach = no_format
			})

			-- PHP
			lspconfig.phpactor.setup({ capabilities = caps })

			-- JavaScript/Typescript
			lspconfig.tsserver.setup({
				capabilities = caps,
				on_attach = no_format
			})
		end
	},

	------------
	-- THEMES
	------------
	{ "flazz/vim-colorschemes", lazy = false, priority = 1000 },  -- vimscript :(
	-- { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	-- { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	-- { "HoNamDuong/hybrid.nvim", lazy = false, priority = 1000 },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- { "Mofiqul/vscode.nvim", lazy = false, priority = 1000, config = function() require("vscode").load() end },
})
vim.cmd.colorscheme "jellyx"

------------

-- Autocommands
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "500" })
  end
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e"
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

-- Always enter terminal in insert mode
autocmd({ "TermOpen", "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
        end
    end
})

-- LEADER MAPPINGS
vim.keymap.set("n", "<Leader>w", ":write<CR>", { silent = true, desc = "Save current file" })
vim.keymap.set("n", "<leader><CR>", ":nohlsearch<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "<leader>.", ":Startify<CR>", { silent = true, desc = "Open start page" })

-- OTHER MAPPINGS
-- buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Switch to next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Switch to previous buffer" })

-- hardcore - remap arrow keys to split resizing
vim.keymap.set("n", "<Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<Down>", ":resize -2<CR>", { silent = true})
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { silent = true})
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", { silent = true})

------------
-- PLUGIN SPECIFIC
------------

-- startify
vim.g.startify_custom_header = ''

--- choosewin (window picker)
vim.keymap.set("n", "=", ":ChooseWin<CR>", { silent = true })
vim.g.choosewin_overlay_enable = 1
vim.g.choosewin_statusline_replace = 0
vim.g.choosewin_tabline_replace = 0

-- telescope
require('telescope').load_extension('fzf')

local telescope = require("telescope.builtin")
--
-- search in project if inside git repo, otherwise search in current directory
--
function project_files()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  telescope.find_files(opts)
end

vim.keymap.set("n", "<leader>f", telescope.find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>b", telescope.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>g", telescope.live_grep, { desc = "Grep files" })
vim.keymap.set("n", "<leader>r", telescope.registers, { desc = "Yank registers" })
vim.keymap.set("n", "<leader>s", telescope.current_buffer_fuzzy_find, { desc = "Current buffer" })
vim.keymap.set("n", "<leader>c", telescope.command_history, { desc = "Command history" })
vim.keymap.set("n", "<leader>h", telescope.search_history, { desc = "Search history" })
vim.keymap.set("n", "<leader>j", telescope.jumplist, { desc = "Jump list" })
vim.keymap.set("n", "<leader>p", project_files, { desc = "Project files" })
-- vim.keymap.set("n", "<leader>t", telescope.treesitter, { desc = "Treesitter search" })
-- vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = "Help tags" })


-- @TODO fix this
-- example mappings you can place in some other place
-- An awesome method to jump to windows
-- local picker = require('window-picker')
--
-- vim.keymap.set("n", "=", function()
-- -- vim.keymap.set("n", ",w", function()
--   local picked_window_id = picker.pick_window({
--     include_current_win = true
--   }) or vim.api.nvim_get_current_win()
--   vim.api.nvim_set_current_win(picked_window_id)
-- end, { desc = "Pick a window" })
--
-- -- Swap two windows using the awesome window picker
-- local function swap_windows()
--   local window = picker.pick_window({
--     include_current_win = false
--   })
--   local target_buffer = vim.fn.winbufnr(window)
--   -- Set the target window to contain current buffer
--   vim.api.nvim_win_set_buf(window, 0)
--   -- Set current window to contain target buffer
--   vim.api.nvim_win_set_buf(0, target_buffer)
-- end
--
-- vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })

