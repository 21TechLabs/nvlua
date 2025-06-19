require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("n", "<A-j>", ":copy .<CR>", {desc="Copy Line Down"})
map("n", "<A-k>", ":copy .-1<CR>", {desc="Copy Line Up"})
map("v", "<A-j>", "y'>p", {desc="Copy Selection Down"})
map("v", "<A-k>", "y'<P", {desc="Copy Selection Up"})

map({"n", "v"}, "<A-S-Down>", ":copy .<CR>", {desc="Copy Line Down"})
map({"n", "v"}, "<A-S-Down>", ":copy .-1<CR>", {desc="Copy Line Up"})
map({"n", "v"}, "<A-S-Down>", "y'>p", {desc="Copy Selection Down"})
map({"n", "v"}, "<A-S-Down>", "y'<P", {desc="Copy Selection Up"})

map("n", "<A-Down>", ":m .+1<CR>==", {desc="Move Line Down"})
map("n", "<A-Up>", ":m .-2<CR>==", {desc="Move Line Up"})

map("v", "<A-Down>", ":m .+1<CR>gv=gv", {desc="Move Line Down"})
map("v", "<A-Up>", ":m .-2<CR>gv=gv", {desc="Move Line Up"})

map("v", "<Del>", '"_d', {desc="Delete Selection (no yank)"})

map("n", "<C-z>", "u", { desc = "Undo" })
map("n", "<C-r>", "<C-r>", { desc = "Redo" })

map("i", "<C-z>", "<C-o>u", { desc = "Undo in insert mode" })
map("i", "<C-r>", "<C-o><C-r>", { desc = "Redo in insert mode" })

map("n", "<C-o>", "<cmd>Telescope find_files<CR>", { desc = "Find files (Ctrl+P)" })
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy find in current buffer" })
-- map("n", "<A-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Global text search" })

-- Navigate windows with Ctrl + Arrow
map({"n", "v"}, "<C-Left>",  "<C-w>h", { desc = "Move to left window" })
map({"n", "v"}, "<C-Down>",  "<C-w>j", { desc = "Move to down window" })
map({"n", "v"}, "<C-Up>",    "<C-w>k", { desc = "Move to up window" })
map({"n", "v"}, "<C-Right>", "<C-w>l", { desc = "Move to right window" })

-- Copy (Ctrl + C)
-- Copy (Ctrl + C)
map("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
-- Paste (Ctrl + V)
map("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
map("i", "<C-v>", '<C-r>+', { desc = "Paste from clipboard in insert mode" })
map("v", "<C-v>", '"+p', { desc = "Paste from clipboard in visual mode" })

-- Shift + Arrow keys to enter or extend visual mode manually
map({"n", "v"}, "<S-Right>", "v<Right>", { desc = "Select with Shift + Right" })
map({"n", "v"}, "<S-Left>", "v<Left>", { desc = "Select with Shift + Left" })
map({"n", "v"}, "<S-Up>", "v<Up>", { desc = "Select with Shift + Up" })
map({"n", "v"}, "<S-Down>", "v<Down>", { desc = "Select with Shift + Down" })
