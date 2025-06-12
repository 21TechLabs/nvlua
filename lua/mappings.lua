require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("n", "<A-j>", ":copy .<CR>", {desc="Copy Line Down"})
map("n", "<A-k>", ":copy .-1<CR>", {desc="Copy Line Up"})

map("v", "<A-j>", "y'>p", {desc="Copy Selection Down"})
map("v", "<A-k>", "y'<P", {desc="Copy Selection Up"})

map("n", "<A-Down>", ":m .+1<CR>==", {desc="Move Line Down"})
map("n", "<A-Up>", ":m .-2<CR>==", {desc="Move Line Up"})

map("v", "<A-Down>", ":m .+1<CR>gv=gv", {desc="Move Line Down"})
map("v", "<A-Up>", ":m .-2<CR>gv=gv", {desc="Move Line Up"})

map("v", "<Del>", '"_d', {desc="Delete Selection (no yank)"})

-- map("", "", "", {desc=""})
-- map("", "", "", {desc=""})
-- map("", "", "", {desc=""})
-- map("", "", "", {desc=""})
