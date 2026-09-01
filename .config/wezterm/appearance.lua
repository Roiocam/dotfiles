local wezterm = require("wezterm")
local mux = wezterm.mux

local M = {}

-- ============================================
-- Window
-- ============================================
M.window_decorations = "RESIZE"
M.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1cell",
	bottom = 0,
}
M.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
	font_size = 16.0,
}

-- ============================================
-- Tab
-- ============================================
M.show_new_tab_button_in_tab_bar = false
M.tab_max_width = 32
M.use_fancy_tab_bar = false
M.tab_bar_at_bottom = true
M.status_update_interval = 500

-- ============================================
-- Colors
-- ============================================
M.color_scheme = nil
M.bold_brightens_ansi_colors = false
M.colors = {
	foreground = "#050605",
	background = "#fff7df",
	cursor_bg = "#5f7f6e",
	cursor_fg = "#fff7df",
	cursor_border = "#5f7f6e",
	selection_fg = "#050605",
	selection_bg = "#bdd8ac",
	compose_cursor = "#5f7f6e",
	ansi = {
		"#050605",
		"#9b2424",
		"#1f7a3a",
		"#6e4b12",
		"#244f80",
		"#592f72",
		"#1f625e",
		"#343832",
	},
	brights = {
		"#4c5149",
		"#bd3434",
		"#2a944a",
		"#835f1d",
		"#346494",
		"#6d4388",
		"#2f7772",
		"#050605",
	},
	tab_bar = {
		background = "none",
		active_tab = {
			bg_color = "none",
			fg_color = "#1f5e37",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "none",
			fg_color = "#20221f",
		},
		inactive_tab_hover = {
			bg_color = "#b8cfa6",
			fg_color = "#101410",
		},
		new_tab = {
			bg_color = "none",
			fg_color = "#4c5149",
		},
	},
}

-- ============================================
-- Fonts
-- ============================================
M.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "DemiBold" },
	"Apple Color Emoji",
})
M.font_size = 14

-- ============================================
-- Workspace strip
-- ============================================
local projects_dir = wezterm.home_dir .. "/.config/wezterm-projects"
local project_workspace_names_cache = nil

local workspace_colors = {
	active_fg = M.colors.tab_bar.active_tab.fg_color,
	inactive_fg = M.colors.tab_bar.inactive_tab.fg_color,
	background = M.colors.tab_bar.background,
}
local status_foreground = "#20221f"

local progress_spinner_frames = {
	"⠋",
	"⠙",
	"⠹",
	"⠸",
	"⠼",
	"⠴",
	"⠦",
	"⠧",
	"⠇",
	"⠏",
}

local function sort_names(names)
	table.sort(names, function(a, b)
		return a:lower() < b:lower()
	end)
	return names
end

local function load_project_workspace_names()
	if project_workspace_names_cache then
		return project_workspace_names_cache
	end

	local names = {}
	local handle = io.popen('ls -1 "' .. projects_dir .. '"/*.lua 2>/dev/null')
	if handle then
		for file in handle:lines() do
			local ok, project = pcall(dofile, file)
			if ok and project and project.workspace then
				table.insert(names, project.workspace)
			end
		end
		handle:close()
	end

	project_workspace_names_cache = sort_names(names)
	return project_workspace_names_cache
end

local function workspace_label(name)
	if name == "default" then
		return name
	end

	local initials = {}
	for word in name:gmatch("%S+") do
		table.insert(initials, word:sub(1, 1):upper())
	end
	if #initials > 1 then
		return table.concat(initials, "")
	end

	if #name > 5 then
		return name:sub(1, 4)
	end

	return name
end

local function workspace_names_for_status(current_workspace)
	local seen = {}
	local names = {}

	local function add_name(name)
		if name and name ~= "" and not seen[name] then
			seen[name] = true
			table.insert(names, name)
		end
	end

	for _, name in ipairs(load_project_workspace_names()) do
		add_name(name)
	end

	local active_names = mux.get_workspace_names and mux.get_workspace_names() or { current_workspace }
	sort_names(active_names)
	for _, name in ipairs(active_names) do
		add_name(name)
	end

	add_name(current_workspace)

	return names
end

local function current_progress_frame()
	local second = tonumber(wezterm.strftime("%S")) or 0
	return progress_spinner_frames[(second % #progress_spinner_frames) + 1]
end

local function short_prefix_token(title)
	if not title or title == "" then
		return nil
	end

	local token = title:match("^([^%s%w]+)%s+")
	if token and (utf8.len(token) or #token) <= 2 then
		return token
	end

	return nil
end

local function pane_loading_indicator(pane)
	if not pane then
		return nil
	end

	if type(pane.title) == "string" then
		local token = short_prefix_token(pane.title)
		if token then
			return token
		end
	end

	if pane.get_title then
		local ok, title = pcall(function()
			return pane:get_title()
		end)
		if ok then
			local token = short_prefix_token(title)
			if token then
				return token
			end
		end
	end

	if pane.progress and pane.progress ~= "None" then
		return current_progress_frame()
	end

	if pane.get_progress then
		local ok, progress = pcall(function()
			return pane:get_progress()
		end)
		if ok and progress and progress ~= "None" then
			return current_progress_frame()
		end
	end

	return nil
end

local function pane_list_loading_indicator(panes)
	for _, pane in ipairs(panes or {}) do
		local indicator = pane_loading_indicator(pane)
		if indicator then
			return indicator
		end
	end

	return nil
end

local function workspace_loading_indicator(workspace)
	for _, mux_window in ipairs(mux.all_windows()) do
		if mux_window:get_workspace() == workspace then
			for _, tab in ipairs(mux_window:tabs()) do
				local ok, panes = pcall(function()
					return tab:panes()
				end)
				if ok then
					local indicator = pane_list_loading_indicator(panes)
					if indicator then
						return indicator
					end
				end
			end
		end
	end

	return nil
end

local function workspace_strip(current_workspace)
	local elements = {
		{ Background = { Color = M.colors.background } },
		{ Text = " " },
	}

	for _, name in ipairs(workspace_names_for_status(current_workspace)) do
		local is_current = name == current_workspace
		local indicator = workspace_loading_indicator(name)
		local label = workspace_label(name)
		local text = indicator and "[" .. indicator .. " " .. label .. "]" or "[" .. label .. "]"

		table.insert(
			elements,
			{ Foreground = { Color = is_current and workspace_colors.active_fg or workspace_colors.inactive_fg } }
		)
		table.insert(elements, { Background = { Color = workspace_colors.background } })
		table.insert(elements, { Attribute = { Intensity = is_current and "Bold" or "Normal" } })
		table.insert(elements, { Text = text })
		table.insert(elements, "ResetAttributes")
		table.insert(elements, { Background = { Color = workspace_colors.background } })
		table.insert(elements, { Text = " " })
	end

	table.insert(elements, "ResetAttributes")
	return wezterm.format(elements)
end

-- ============================================
-- Apply to config
-- ============================================
function M.apply(config)
	-- Window
	config.window_decorations = M.window_decorations
	config.window_padding = M.window_padding
	config.window_frame = M.window_frame

	-- Tab
	config.show_new_tab_button_in_tab_bar = M.show_new_tab_button_in_tab_bar
	config.tab_max_width = M.tab_max_width
	config.use_fancy_tab_bar = M.use_fancy_tab_bar
	config.tab_bar_at_bottom = M.tab_bar_at_bottom
	config.status_update_interval = M.status_update_interval

	-- Colors
	config.color_scheme = M.color_scheme
	config.bold_brightens_ansi_colors = M.bold_brightens_ansi_colors
	config.colors = M.colors

	-- Fonts
	config.font = M.font
	config.font_size = M.font_size

	-- Tab title format (UTF-8 safe)
	wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
		local index = tab.tab_index + 1
		local indicator = pane_list_loading_indicator(tab.panes or panes)
		local title = tab.active_pane.title
		local active_indicator = short_prefix_token(title)
		if indicator and indicator ~= active_indicator then
			title = indicator .. " " .. title
		end
		local max_chars = 20
		local char_len = utf8.len(title) or 0
		if char_len > max_chars then
			local byte_pos = utf8.offset(title, max_chars - 1) or #title
			title = title:sub(1, byte_pos - 1) .. ".."
		end
		return string.format(" %d:%s ", index, title)
	end)

	-- Status bar
	wezterm.on("update-status", function(window, pane)
		local workspace = window:active_workspace()
		local date = wezterm.strftime("%Y/%m/%d %H:%M:%S")

		window:set_left_status(workspace_strip(workspace))

		window:set_right_status(wezterm.format({
			{ Foreground = { Color = status_foreground } },
			{ Text = " " .. date .. " " },
		}))
	end)
end

return M
