vim.g.mapleader = " "

----------------------
-- General Settings --
----------------------
vim.opt.updatetime = 300
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.wo.number = true
vim.opt.cmdheight = 0

-- Clipboard (Scheduled to avoid startup lag)
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

---------------------------
-- Window & Utils Maps  --
---------------------------
-- Resize windows
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":resize -2<CR>", { silent = true })

-- Sort lines
vim.keymap.set("n", "<Leader>us", ":%!sort<CR>", { silent = true, desc = "[S]ort Lines" })

-- Simple Terminal split
vim.keymap.set("n", "<Leader>ut", function()
  local height = math.floor(vim.opt.lines:get() / 3)
  vim.cmd("belowright split | resize " .. height .. " | terminal")
end, { desc = "[T]erminal" })

-- Toggle Line Numbers
vim.keymap.set("n", "<leader>tl", function()
  vim.wo.number = not vim.wo.number
end, { desc = "[L]inenumbers" })

---------------------------
-- Basic Buffer Commands --
---------------------------
vim.keymap.set("n", "<Leader>bw", ":w<CR>", { desc = "[W]rite" })

---------------------------
-- Diagnostic Settings   --
---------------------------
vim.diagnostic.config({
  virtual_text = false,
  float = { border = "rounded" },
})

vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[N]ext' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[P]revious' })
vim.keymap.set('n', '<leader>dw', vim.diagnostic.open_float, { desc = '[W]indow' })
