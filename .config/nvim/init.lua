-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":<C-u>m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":<C-u>m '<-2<CR>gv=gv")
