vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "light"
vim.g.colors_name = "wezterm-paper"

local p = {
  bg = "#fff7df",
  bg_soft = "#f7efd2",
  bg_muted = "#eadfbd",
  bg_hover = "#dbe7c2",
  fg = "#050605",
  fg_soft = "#20221f",
  fg_muted = "#4c5149",
  red = "#9b2424",
  red_bright = "#bd3434",
  green = "#1f7a3a",
  green_soft = "#5f7f6e",
  green_bright = "#2a944a",
  yellow = "#6e4b12",
  yellow_bright = "#835f1d",
  blue = "#244f80",
  blue_bright = "#346494",
  purple = "#592f72",
  purple_bright = "#6d4388",
  cyan = "#1f625e",
  cyan_bright = "#2f7772",
  selection = "#bdd8ac",
  border = "#d6cbaa",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = p.fg, bg = p.bg })
hi("NormalNC", { fg = p.fg_soft, bg = p.bg })
hi("NormalFloat", { fg = p.fg, bg = p.bg_soft })
hi("FloatBorder", { fg = p.green_soft, bg = p.bg_soft })
hi("FloatTitle", { fg = p.green, bg = p.bg_soft, bold = true })
hi("SignColumn", { fg = p.fg_muted, bg = p.bg })
hi("FoldColumn", { fg = p.fg_muted, bg = p.bg })
hi("LineNr", { fg = p.fg_muted, bg = p.bg })
hi("CursorLine", { bg = p.bg_soft })
hi("CursorLineNr", { fg = p.green, bg = p.bg_soft, bold = true })
hi("CursorColumn", { bg = p.bg_soft })
hi("ColorColumn", { bg = p.bg_soft })
hi("Visual", { fg = p.fg, bg = p.selection })
hi("VisualNOS", { fg = p.fg, bg = p.selection })
hi("Search", { fg = p.fg, bg = p.selection })
hi("IncSearch", { fg = p.bg, bg = p.green_soft })
hi("CurSearch", { fg = p.bg, bg = p.green_soft, bold = true })
hi("Substitute", { fg = p.bg, bg = p.yellow_bright })
hi("MatchParen", { fg = p.green, bg = p.bg_hover, bold = true })
hi("Conceal", { fg = p.fg_muted, bg = p.bg })
hi("NonText", { fg = p.bg_muted })
hi("Whitespace", { fg = p.bg_muted })
hi("SpecialKey", { fg = p.fg_muted })
hi("EndOfBuffer", { fg = p.bg })
hi("WinSeparator", { fg = p.border, bg = p.bg })
hi("VertSplit", { fg = p.border, bg = p.bg })
hi("Directory", { fg = p.green, bold = true })
hi("Title", { fg = p.green, bold = true })

hi("Cursor", { fg = p.bg, bg = p.green_soft })
hi("lCursor", { fg = p.bg, bg = p.green_soft })
hi("TermCursor", { fg = p.bg, bg = p.green_soft })
hi("TermCursorNC", { fg = p.bg, bg = p.fg_muted })

hi("StatusLine", { fg = p.fg_soft, bg = p.bg_muted })
hi("StatusLineNC", { fg = p.fg_muted, bg = p.bg_soft })
hi("TabLine", { fg = p.fg_soft, bg = p.bg_soft })
hi("TabLineSel", { fg = p.green, bg = p.bg, bold = true })
hi("TabLineFill", { fg = p.fg_muted, bg = p.bg })
hi("WinBar", { fg = p.fg_soft, bg = p.bg })
hi("WinBarNC", { fg = p.fg_muted, bg = p.bg })

hi("Pmenu", { fg = p.fg, bg = p.bg_soft })
hi("PmenuSel", { fg = p.fg, bg = p.selection })
hi("PmenuSbar", { bg = p.bg_muted })
hi("PmenuThumb", { bg = p.green_soft })
hi("WildMenu", { fg = p.fg, bg = p.selection })

hi("Comment", { fg = p.fg_muted, italic = true })
hi("Constant", { fg = p.purple })
hi("String", { fg = p.green })
hi("Character", { fg = p.green })
hi("Number", { fg = p.purple })
hi("Boolean", { fg = p.purple, bold = true })
hi("Float", { fg = p.purple })
hi("Identifier", { fg = p.blue })
hi("Function", { fg = p.blue, bold = true })
hi("Statement", { fg = p.red })
hi("Conditional", { fg = p.red })
hi("Repeat", { fg = p.red })
hi("Label", { fg = p.red })
hi("Operator", { fg = p.fg_soft })
hi("Keyword", { fg = p.red, bold = true })
hi("Exception", { fg = p.red })
hi("PreProc", { fg = p.yellow })
hi("Include", { fg = p.yellow })
hi("Define", { fg = p.yellow })
hi("Macro", { fg = p.yellow })
hi("PreCondit", { fg = p.yellow })
hi("Type", { fg = p.cyan })
hi("StorageClass", { fg = p.cyan })
hi("Structure", { fg = p.cyan })
hi("Typedef", { fg = p.cyan })
hi("Special", { fg = p.purple })
hi("SpecialChar", { fg = p.purple })
hi("Tag", { fg = p.blue })
hi("Delimiter", { fg = p.fg_soft })
hi("Debug", { fg = p.red })
hi("Underlined", { fg = p.blue, underline = true })
hi("Bold", { bold = true })
hi("Italic", { italic = true })

hi("Error", { fg = p.red_bright, bold = true })
hi("Todo", { fg = p.yellow, bg = p.bg_hover, bold = true })
hi("Question", { fg = p.green })
hi("MoreMsg", { fg = p.green })
hi("ModeMsg", { fg = p.green })
hi("WarningMsg", { fg = p.yellow })
hi("ErrorMsg", { fg = p.red_bright })

hi("DiagnosticError", { fg = p.red_bright })
hi("DiagnosticWarn", { fg = p.yellow_bright })
hi("DiagnosticInfo", { fg = p.blue_bright })
hi("DiagnosticHint", { fg = p.cyan_bright })
hi("DiagnosticOk", { fg = p.green_bright })
hi("DiagnosticUnderlineError", { sp = p.red_bright, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = p.yellow_bright, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = p.blue_bright, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = p.cyan_bright, undercurl = true })
hi("DiagnosticVirtualTextError", { fg = p.red, bg = p.bg_soft })
hi("DiagnosticVirtualTextWarn", { fg = p.yellow, bg = p.bg_soft })
hi("DiagnosticVirtualTextInfo", { fg = p.blue, bg = p.bg_soft })
hi("DiagnosticVirtualTextHint", { fg = p.cyan, bg = p.bg_soft })
hi("DiagnosticFloatingError", { fg = p.red_bright, bg = p.bg_soft })
hi("DiagnosticFloatingWarn", { fg = p.yellow_bright, bg = p.bg_soft })
hi("DiagnosticFloatingInfo", { fg = p.blue_bright, bg = p.bg_soft })
hi("DiagnosticFloatingHint", { fg = p.cyan_bright, bg = p.bg_soft })

hi("DiffAdd", { fg = p.green, bg = "#e6efd2" })
hi("DiffChange", { fg = p.blue, bg = "#edf0d6" })
hi("DiffDelete", { fg = p.red, bg = "#f4e4cf" })
hi("DiffText", { fg = p.blue, bg = "#d8e4c8", bold = true })
hi("Added", { fg = p.green })
hi("Changed", { fg = p.blue })
hi("Removed", { fg = p.red })

hi("GitSignsAdd", { fg = p.green, bg = p.bg })
hi("GitSignsChange", { fg = p.blue, bg = p.bg })
hi("GitSignsDelete", { fg = p.red, bg = p.bg })
hi("GitSignsAddNr", { fg = p.green, bg = p.bg })
hi("GitSignsChangeNr", { fg = p.blue, bg = p.bg })
hi("GitSignsDeleteNr", { fg = p.red, bg = p.bg })

hi("TreesitterContext", { bg = p.bg_soft })
hi("TreesitterContextLineNumber", { fg = p.green, bg = p.bg_soft })
hi("WhichKey", { fg = p.green })
hi("WhichKeyDesc", { fg = p.fg })
hi("WhichKeyGroup", { fg = p.blue })
hi("WhichKeySeparator", { fg = p.fg_muted })
hi("WhichKeyFloat", { bg = p.bg_soft })

hi("SnacksDashboardHeader", { fg = p.green, bold = true })
hi("SnacksDashboardDesc", { fg = p.fg_soft })
hi("SnacksDashboardIcon", { fg = p.green })
hi("SnacksDashboardKey", { fg = p.purple })
hi("SnacksDashboardFooter", { fg = p.fg_muted })
hi("SnacksPicker", { fg = p.fg, bg = p.bg_soft })
hi("SnacksPickerBorder", { fg = p.green_soft, bg = p.bg_soft })
hi("SnacksPickerMatch", { fg = p.green, bold = true })

hi("BlinkCmpMenu", { fg = p.fg, bg = p.bg_soft })
hi("BlinkCmpMenuBorder", { fg = p.green_soft, bg = p.bg_soft })
hi("BlinkCmpMenuSelection", { fg = p.fg, bg = p.selection })
hi("BlinkCmpLabelMatch", { fg = p.green, bold = true })
hi("BlinkCmpKind", { fg = p.purple })
hi("BlinkCmpDoc", { fg = p.fg, bg = p.bg_soft })
hi("BlinkCmpDocBorder", { fg = p.green_soft, bg = p.bg_soft })
hi("BlinkCmpSignatureHelp", { fg = p.fg, bg = p.bg_soft })
hi("BlinkCmpSignatureHelpBorder", { fg = p.green_soft, bg = p.bg_soft })

hi("NeoTreeNormal", { fg = p.fg, bg = p.bg })
hi("NeoTreeNormalNC", { fg = p.fg_soft, bg = p.bg })
hi("NeoTreeDirectoryName", { fg = p.green })
hi("NeoTreeDirectoryIcon", { fg = p.green })
hi("NeoTreeFileName", { fg = p.fg_soft })
hi("NeoTreeFileNameOpened", { fg = p.fg, bold = true })
hi("NeoTreeGitAdded", { fg = p.green })
hi("NeoTreeGitModified", { fg = p.blue })
hi("NeoTreeGitDeleted", { fg = p.red })
hi("NeoTreeGitIgnored", { fg = p.fg_muted })

hi("LazyNormal", { fg = p.fg, bg = p.bg_soft })
hi("LazyButton", { fg = p.fg_soft, bg = p.bg_muted })
hi("LazyButtonActive", { fg = p.fg, bg = p.selection, bold = true })
hi("LazyH1", { fg = p.bg, bg = p.green_soft, bold = true })
hi("LazyH2", { fg = p.green, bold = true })
hi("LazySpecial", { fg = p.purple })

hi("LspReferenceText", { bg = p.bg_hover })
hi("LspReferenceRead", { bg = p.bg_hover })
hi("LspReferenceWrite", { bg = p.bg_hover, underline = true })
hi("LspInlayHint", { fg = p.fg_muted, bg = p.bg_soft })

local ts = {
  ["@comment"] = "Comment",
  ["@keyword"] = "Keyword",
  ["@keyword.function"] = "Keyword",
  ["@keyword.return"] = "Keyword",
  ["@conditional"] = "Conditional",
  ["@repeat"] = "Repeat",
  ["@operator"] = "Operator",
  ["@function"] = "Function",
  ["@function.method"] = "Function",
  ["@function.builtin"] = "Function",
  ["@constructor"] = "Function",
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@string"] = "String",
  ["@number"] = "Number",
  ["@boolean"] = "Boolean",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@property"] = "Identifier",
  ["@field"] = "Identifier",
  ["@punctuation"] = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter",
  ["@tag"] = "Tag",
  ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",
  ["@markup.heading"] = "Title",
  ["@markup.link"] = "Underlined",
  ["@markup.raw"] = "String",
  ["@diff.plus"] = "Added",
  ["@diff.delta"] = "Changed",
  ["@diff.minus"] = "Removed",
}

for group, link in pairs(ts) do
  hi(group, { link = link })
end
