-- 行番号を表示
vim.opt.number = true

-- ターミナルのタイトルを表示
vim.opt.title = true
-- 文字コードをutf-8に変換
vim.opt.encoding = "utf-8"
-- Tab文字の表示幅（半角スペース4つ分）
vim.opt.tabstop = 4
-- 不可視文字の可視化（Tabを[^ ]と表示する）
vim.opt.list = true

vim.opt.clipboard = "unnamed"

-- ESC to jk
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
-- リーダーキーをスペースで設定可能に
vim.g.mapleader = " "

vim.cmd("filetype plugin indent on")

-- windows wsl only settings 
-- but if you write if vim.fn.has("win64") == 1 then , system cant use clipboard.
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
    },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf"
    },
  cache_enable = 0,
  }
end
