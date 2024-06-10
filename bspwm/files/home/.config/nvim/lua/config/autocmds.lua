-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Создание группы автокомманд
local autosave_group = vim.api.nvim_create_augroup("AutosaveOnBufferSwitch", { clear = true })

-- Добавление автокомманды для сохранения всех буферов при переключении
vim.api.nvim_create_autocmd("BufLeave", {
  group = autosave_group,
  command = "silent! wall",
})

local autocmd = vim.api.nvim_create_autocmd
autocmd('Filetype', {
  pattern = { 'tpp' },
  command = 'set filetype=cpp'
})
