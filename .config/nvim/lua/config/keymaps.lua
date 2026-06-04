-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function lua_literal(value)
  local t = type(value)
  if t == "string" then
    return string.format("%q", value)
  end
  if t == "boolean" then
    return value and "true" or "false"
  end
  return tostring(value)
end

local function notify_option_hint(option, opts)
  opts = opts or {}
  local scope = opts.global and "global" or "local"
  local value = vim.api.nvim_get_option_value(option, { scope = scope })
  local target = opts.global and "vim.opt" or "vim.opt_local"
  vim.notify(
    string.format(
      "Option: %s (%s)\nUse in config: %s.%s = %s\nInspect source: :verbose set %s?",
      option,
      scope,
      target,
      option,
      lua_literal(value),
      option
    ),
    vim.log.levels.INFO,
    { title = "Option Hint" }
  )
end

Snacks.toggle.option("spell", {
  name = "Spelling",
  notify = function()
    notify_option_hint("spell")
  end,
}):map("<leader>us")

Snacks.toggle.option("wrap", {
  name = "Wrap",
  notify = function()
    notify_option_hint("wrap")
  end,
}):map("<leader>uw")

Snacks.toggle.option("relativenumber", {
  name = "Relative Number",
  notify = function()
    notify_option_hint("relativenumber")
  end,
}):map("<leader>uL")

Snacks.toggle.option("background", {
  name = "Dark Background",
  off = "light",
  on = "dark",
  global = true,
  notify = function()
    notify_option_hint("background", { global = true })
  end,
}):map("<leader>ub")

local function safe_del(mode, lhs)
  pcall(vim.keymap.del, mode, lhs)
end

--- Open the LazyVim terminal in a floating window while preserving the current cwd choice.
local function floating_terminal(opts)
  opts = vim.tbl_deep_extend("force", {
    win = {
      position = "float",
    },
  }, opts or {})
  Snacks.terminal(nil, opts)
end

safe_del("n", "<leader>fT")
safe_del("n", "<leader>ft")
safe_del({ "n", "t" }, "<c-/>")
safe_del({ "n", "t" }, "<c-_>")

vim.keymap.set("n", "<leader>fT", function()
  floating_terminal()
end, { desc = "Terminal (Float Cwd)" })

vim.keymap.set("n", "<leader>ft", function()
  floating_terminal({ cwd = LazyVim.root() })
end, { desc = "Terminal (Float Root Dir)" })

vim.keymap.set({ "n", "t" }, "<c-/>", function()
  floating_terminal({ cwd = LazyVim.root() })
end, { desc = "Terminal (Float Root Dir)" })

vim.keymap.set({ "n", "t" }, "<c-_>", function()
  floating_terminal({ cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })
