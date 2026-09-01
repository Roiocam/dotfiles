-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_blink_main = false
vim.opt.spell = false
vim.opt.background = "light"
vim.opt.guicursor =
  "n-v-c-sm:block-blinkon300-blinkoff200,i-ci-ve:ver25-blinkon300-blinkoff200,r-cr-o:hor20-blinkon300-blinkoff200,t:block-blinkon300-blinkoff200"
return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.appearance = opts.appearance or {}
      opts.appearance.kind_icons = vim.tbl_extend("force", opts.appearance.kind_icons or {}, LazyVim.config.icons.kinds)
    end,
  },
}
