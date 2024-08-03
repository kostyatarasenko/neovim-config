-- This file simply bootstraps the installation of lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" } }, { "Press any key to exit...", "MoreMsg" }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- require("lazy").setup({
--   -- Здесь добавляем установку темы nightfox и других необходимых плагинов
--   { "EdenEast/nightfox.nvim" },
--   { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
--   { "neovim/nvim-lspconfig" },
--   { "nvim-telescope/telescope.nvim", requires = { {"nvim-lua/plenary.nvim"} } },
--   -- Добавьте другие плагины по необходимости
-- })
--
-- -- Настройка темы nightfox
-- require('nightfox').setup({
--   options = {
--     -- Выберите одну из тем: "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox"
--     fox = "nightfox", -- Выберите тему
--     styles = {
--       comments = "italic", -- Сделать комментарии курсивом
--       keywords = "bold", -- Сделать ключевые слова жирными
--       functions = "italic,bold", -- Сделать функции курсивом и жирными
--     },
--     inverse = {
--       match_paren = true, -- Инвертировать цвета для совпадающих скобок
--       visual = false, -- Не инвертировать цвета для визуального режима
--       search = false, -- Не инвертировать цвета для результатов поиска
--     },
--   },
--   palettes = {}, -- Настройка палитр (если нужно)
--   specs = {}, -- Настройка спецификаций (если нужно)
--   groups = {}, -- Настройка групп (если нужно)
-- })
--
-- -- Применение темы
-- vim.cmd("colorscheme nightfox")
--
-- -- Настройка LSP
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup{}
-- lspconfig.tsserver.setup{}
--
-- -- Настройка Treesitter
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained",
--   highlight = {
--     enable = true,
--   },
-- }

require("lazy_setup")
require("polish")
