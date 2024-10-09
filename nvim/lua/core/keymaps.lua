-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- spell checker change language
-- keymap.set("n", "<leader>cl", ":setlocal spell spelllang=es_es<CR>", {desc = ""})
keymap.set("n", "<leader>cl", function() vim.cmd("setlocal spelllang=" .. (vim.bo.spelllang == "es" and "en" or "es")) end, {desc = "Toggle spell check language between Spanish and English"})

-- General keymaps
keymap.set("i", "kj", "<ESC>")

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Moving lines around
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Better moving
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- copy with out lose the pasted
keymap.set("x", "<leader>p", "\"_dP")

-- Better clipboard interaction
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("n", "<leader>bp", "\"+p")
keymap.set("v", "<leader>bp", "\"+p")
keymap.set("n", "<leader>bP", "\"+P")

-- keymap.set("n", "<leader>d", "\"_d")
-- keymap.set("v", "<leader>d", "\"_d")

-- Linting

keymap.set("n", "<leader>gl", function() -- Create a custom key mapping
    require("lint").try_lint()           -- Trigger linting for the current file
end, { desc = "Trigger linting for current file" })

-- Tmux new session
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Advanced replace search
keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Advanced replace search"})

-- Source file
keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {desc = "Source file"})

-- Slit window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "split window vertically"})     -- split window vertically
keymap.set("n", "<leader>ss", "<C-w>s", {desc = "split window horizontally"})     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", {desc = "make split windows equal width"})     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", {desc = "close split window"}) -- close split window
keymap.set("n", "<leader>sj", "<C-w>-", {desc = "make split window height shorter"})     -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+", {desc = "make split windows height taller"})     -- make split windows height taller
keymap.set("n", "<leader>sl", "<C-w>>5", {desc = "make split windows width bigger"})    -- make split windows width bigger
keymap.set("n", "<leader>sh", "<C-w><5", {desc = "make split windows width smaller"})    -- make split windows width smaller
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", {desc = "toggle maximize tab"}) -- toggle maximize tab

-- Tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

-- Trouble
-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", {desc = "put diff from current to other during diff"})   -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>", {desc = "get diff from left (local) during merge"}) -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>", {desc = "get diff from right (remote) during merge"}) -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c", {desc = "Next diff hunk"})             -- next diff hunk
keymap.set("n", "<leader>cp", "[c", {desc = "Previous diff hunk"})             -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", {desc = "open quickfix list"})  -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>", {desc = "jump to first quickfix list item"}) -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>", {desc = "jump to next quickfix list item"})  -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>", {desc = "jump to prev quickfix list item"})  -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>", {desc = "jump to last quickfix list item"})  -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>", {desc = "close quickfix list"}) -- close quickfix list

-- Telescope
keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, {desc = "Opens a Telescope prompt to search and navigate your Git repository files."}) -- Opens a Telescope prompt to search and navigate your Git repository files.
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {desc = "Opens a Telescope prompt to search and access Neovim help tags."}) -- Opens a Telescope prompt to search and access Neovim help tags.
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = "Opens a Telescope prompt to search and open files on your system."}) -- Opens a Telescope prompt to search and open files on your system.
keymap.set('n', '<leader>fa', require('telescope.builtin').live_grep, {desc = "Opens a Telescope prompt to search real-time across your project files using a user-provided pattern."}) -- Opens a Telescope prompt to search real-time across your project files using a user-provided pattern.
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {desc = "Opens a Telescope prompt to switch and manage open buffers in Neovim."}) -- Opens a Telescope prompt to switch and manage open buffers in Neovim.
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {desc = "Opens a Telescope prompt to search within the currently open buffer."}) -- Opens a Telescope prompt to search within the currently open buffer.
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {desc = "Opens a Telescope prompt to search and navigate symbols within the current document using Language Server Protocol (LSP) integration."}) -- Opens a Telescope prompt to search and navigate symbols within the current document using Language Server Protocol (LSP) integration.
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {desc = "Opens a Telescope prompt to search for references to the currently selected symbol using LSP integration."}) -- Opens a Telescope prompt to search for references to the currently selected symbol using LSP integration.
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end, {desc = "This custom function utilizes Telescope's treesitter provider and sets the default text to 'method:', likely used for finding and selecting methods within your code."}) -- This custom function utilizes Telescope's treesitter provider and sets the default text to ":method:", likely used for finding and selecting methods within your code.

-- Vim fugitive
keymap.set('n', '<leader>gG', vim.cmd.Git, {desc = "Vim fugitive"})

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", {desc = "toggle git blame"}) -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, {desc = "Add file to harpoon"})
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, {desc = "Marks UI menu"})
keymap.set("n", "<leader>ht", ":Telescope harpoon marks<CR>")
keymap.set("n", "<leader>hc", require('harpoon.cmd-ui').toggle_quick_menu, {desc = "Commands UI menu"})
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end, {desc = "Navigate to 1"})
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end, {desc = "Navigate to 2"})
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end, {desc = "Navigate to 3"})
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end, {desc = "Navigate to 4"})
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end, {desc = "Navigate to 5"})
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end, {desc = "Navigate to 6"})
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end, {desc = "Navigate to 7"})
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end, {desc = "Navigate to 8"})
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end, {desc = "Navigate to 9"})
keymap.set("n", "<leader>hg1", function() require("harpoon.tmux").sendCommand("2", 1); require("harpoon.tmux").gotoTerminal("2") end, {desc = "Run the first command on Tmux pane 2"})

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = "Toggle undo tree"})

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
-- Normal mode, starting with <leader>l
keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', {desc = "LSP: Code Action"})
keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = "LSP: Go to Definition"})
keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {desc = "LSP: Go to Declaration"})
keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', {desc = "LSP: Format Code"})
keymap.set('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', {desc = "LSP: Hover Documentation"})
keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', {desc = "LSP: Go to Implementation"})
keymap.set('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<CR>', {desc = "LSP: Show Line Diagnostics"})
keymap.set('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next()<CR>', {desc = "LSP: Go to Next Diagnostic"})
keymap.set('n', '<leader>lp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {desc = "LSP: Go to Previous Diagnostic"})
keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', {desc = "LSP: Show References"})
keymap.set('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', {desc = "LSP: Rename Symbol"})
keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {desc = "LSP: Document Symbols"})
keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {desc = "LSP: Type Definition"})
keymap.set('n', '<leader>lws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {desc = "LSP: Workspace Symbol"})
keymap.set('n', '<leader>l?', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {desc = "LSP: Signature Help"})

-- Visual mode, starting with <leader>g

keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', {desc = "LSP: Format Code"})

-- Insert mode

keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', {desc = "LSP: Trigger Completion"})


-- Vim-maximizer

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc = "Set breakpoint"})
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", {desc = "Set conditonal breakpoint"})
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", {desc = "Set message logger"})
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", {desc = "Clear all breakpoints"})
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", {desc = "List in Telescope all breakpoints"})

-- Debugging starting with d
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {desc = "Start Debugging or continues execution until the next breakpoint or end of program"})
keymap.set("n", '<leader>dd', function()
    require('dap').disconnect(); require('dapui').close();
end, {desc = "Disconnects the debugger and closes the DAP UI"})
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end, {desc = "Shows diagnostics (errors) using Telescope with a default filter for ':E:'"})
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', {desc = "Lists stack frames using Telescope"})
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', {desc = "Lists DAP commands using Telescope"})
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, {desc = "Shows the value of the variable under the cursor"})
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", {desc = "Steps over"})
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", {desc = "Steps into"})
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", {desc = "Re-runs the last debug configuration"})
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", {desc = "Steps out"})
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", {desc = "Toggles the REPL (Read-Eval-Print Loop) interface"})
keymap.set("n", '<leader>dt', function()
    require('dap').terminate(); require('dapui').close();
end, {desc = "Terminates the debugging session and closes the DAP UI"})
keymap.set("n", "<leader>dut", "<cmd>lua require('dapui').toggle()<cr>", {desc = "Toggle DAP UI"})
keymap.set("n", "<leader>dur", "<cmd>lua require('dapui').open({reset = true})<cr>", {desc = "Rest DAP UI panes"})
keymap.set("n", '<leader>d?',
    function()
        local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
    end, {desc = "Displays variable scopes in a centered floating window"})

-- ChatGPT
-- keymap.set({"n", "v"}, "<leader>ac", "<cmd>ChatGPT<CR>", {desc = "ChatGPT"})

keymap.set({"n", "v"}, "<leader>ac", "<cmd>ChatGPT<CR>", { desc = "ChatGPT", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Grammar Correction", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>at", "<cmd>ChatGPTRun translate<CR>", { desc = "Translate", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", { desc = "Keywords", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", { desc = "Docstring", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", { desc = "Add Tests", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "Optimize Code", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>as", "<cmd>ChatGPTRun summarize<CR>", { desc = "Summarize", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "Fix Bugs", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", { desc = "Explain Code", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "Roxygen Edit", noremap = true, silent = true })
keymap.set({"n", "v"}, "<leader>al", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "Code Readability Analysis", noremap = true, silent = true })

