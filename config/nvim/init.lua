require("config.lazy")

-- ---------------------------------------------------------------------------
-- File

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,sjis,iso-2022-jp,euc-jp,cp932"
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.history = 1000
vim.opt.autoread = true
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
-- vim.opt.undodir = "~/.vim/undo"
vim.opt.undofile = true

-- ---------------------------------------------------------------------------
-- General

-- let mapleader = "\<Space>"
vim.opt.compatible = false
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.modeline = true
vim.opt.virtualedit = "block"
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = true
vim.opt.infercase = true
vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.secure = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.lazyredraw = true
vim.opt.switchbuf = "useopen,usetab,newtab"
vim.opt.timeoutlen = 500
vim.opt.iskeyword:remove("_")
vim.opt.guicursor = ""

-- ---------------------------------------------------------------------------
-- Search

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.magic = true

-- ---------------------------------------------------------------------------
-- Appearance

vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showtabline = 2
vim.opt.showmatch = true
vim.opt.matchpairs:append("<:>")
vim.opt.matchtime = 2
vim.opt.textwidth = 0
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "»-" }
vim.opt.colorcolumn = "80"


-- ---------------------------------------------------------------------------
-- Indent

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- ---------------------------------------------------------------------------
-- Keymaps

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<CR>", { silent = true })

-- Exchange of ; for :
vim.keymap.set("n", "q;", "q:", { silent = true })
vim.keymap.set("n", ";", ":", { silent = true })
vim.keymap.set("n", ":", ";", { silent = true })

-- Remap VIM 0 to first non-blank character
vim.keymap.set({ "n", "v", "o" }, "0", "^", { silent = true })

-- Move to pair by <TAB>
vim.keymap.set("n", "<TAB>", "%", { silent = true })
vim.keymap.set("v", "<TAB>", "%", { silent = true })

-- Search selected word
vim.keymap.set("v", "*", "\"zy:let @/ = @z<CR>nN", { silent = true })

-- Use <C-s> as <ESC>
vim.keymap.set({ "n", "i", "v", "c" }, "<C-s>", "<ESC>", { silent = true })

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Emacs keybind: Move cursor on Insert Mode and CommandLine Mode
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>", { silent = true })
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>", { silent = true })
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>", { silent = true })
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>", { silent = true })

-- Move cursor on CommandLine Mode
vim.keymap.set("c", "<C-p>", "<Up>", { silent = true })
vim.keymap.set("c", "<C-n>", "<Down>", { silent = true })

-- Move cursor on Visual Mode
vim.keymap.set("v", "<C-a>", "<Home>", { silent = true })
vim.keymap.set("v", "<C-e>", "<End>", { silent = true })

-- Control window size
vim.keymap.set("n", "<leader><Left>", "<C-w><", { silent = true })
vim.keymap.set("n", "<leader><Right>", "<C-w>>", { silent = true })
vim.keymap.set("n", "<leader><Up>", "<C-w>-", { silent = true })
vim.keymap.set("n", "<leader><Down>", "<C-w>+", { silent = true })

-- Redraw line at center when search
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })

-- Move cursor as display line
vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })
vim.keymap.set({ "n", "v" }, "gj", "j", { silent = true })
vim.keymap.set({ "n", "v" }, "gk", "k", { silent = true })

-- Disable highlight when <leader><cr> is pressed
vim.keymap.set("n", "<leader><CR>", ":noh<CR>", { silent = true })

-- Opens a new tab with the current buffer's path
vim.keymap.set("n", "<leader>te", ":tabedit <C-R>=expand('%:p:h')<CR>/", { silent = true })

-- Usefull commands (command-mode mappings)
vim.cmd([[cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>]])
vim.cmd([[command! W w !sudo tee % > /dev/null]])

-- Display multiple candidates on splited window
vim.keymap.set("n", "<C-]>", ":sp<CR>:exe('tjump '.expand('<cword>'))<CR>", { silent = true })

