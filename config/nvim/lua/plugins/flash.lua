-- When I press `s`` in normal mode, Vim's built-in is "substitute character" (delete the char under cursor, enter insert mode).
-- LazyVim rebinds s to require("flash").jump() in ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/editor.lua:38 (modes n, x, o).
-- We disable flash to keep the built-in behavior.
-- We could also do:
-- return { { "folke/flash.nvim", keys = { { "s", mode = { "n", "x", "o" }, false } } } }
-- but for now, let's just disable it.
return {
	{ "folke/flash.nvim", enabled = false },
}
