-- WezTerm project definition. Override DOTFILES_PROJECT_ROOT when needed.
local project_root = os.getenv("DOTFILES_PROJECT_ROOT") or ((os.getenv("HOME") or "") .. "/IdeaProject")

return {
	workspace = "agent",
	cwd = project_root .. "/opensource/agents/agent-session",
	tabs = {
		{ cmd = "cx", layout = "right_stack" },
		{ cmd = "nvim" },
		{ cmd = nil }, -- empty shell
	},
}
