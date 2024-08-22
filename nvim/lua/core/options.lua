local opt = vim.opt

-- Session Management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.cmdheight = 1  -- or any number you prefer

-- Spell check
opt.spelllang = 'en_us'
opt.spell = true
vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"

-- Identation
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Yanking highlight
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "YankHighlight",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({higroup="IncSearch", timeout=150})
    end,
})

-- Line Number
opt.relativenumber = true
opt.number = true

-- Tabs & Identation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 4

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Cursor Line
opt.cursorline = true
opt.guicursor = ""

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Performance
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
-- opt.iskeyword:append("-")
-- opt.iskeyword:append("_")

-- Remove underscore from `iskeyword` for all file types
opt.iskeyword:remove("_")

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Scrolling
opt.scrolloff = 8
opt.signcolumn = "yes"

-- Misc
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
