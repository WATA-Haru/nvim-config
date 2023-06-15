# nvim-config

## Location
```~/.config/nvim/init.lua```

## WSL clipboard settings
windowsのWSL上でnvimを使用する際に%yなどでヤンクした行が、windowsのクリップボードに反映されない事象が起こった

解決策
環境: windows11 WSL

1. win32yankのインストール(x64)
[win32yank](https://github.com/equalsraf/win32yank/releases)

2. ~/binの作成とwin32yank.exeの移動
```
mkdir ~/bin
mv ~/Downloads/win32yank.exe ~/bin
cd ~/bin
chmod +x win32yank.exe
```

3. PATHを通す
```vim ~/.bashrc```

.bashrcの最後に以下を追記、ターミナルの再起動を行う
```
export PATH=$HOME/bin:/usr/local/bin:$PATH
```

4. PATHの確認
```
echo $PATH
```

5. init.luaの設定

```init.lua
vim.opt.clipboard = "unnamedplus"

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
```
参考
[WSL2でtmux/vimのクリップボードをwinと共有する設定](https://zenn.dev/kujirahand/articles/4b37160f781be7)


