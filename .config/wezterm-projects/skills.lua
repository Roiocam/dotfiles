-- WezTerm project definition. Override DOTFILES_PROJECT_ROOT when needed.
local project_root = os.getenv("DOTFILES_PROJECT_ROOT") or ((os.getenv("HOME") or "") .. "/IdeaProject")

return {
	workspace = "skill",
	cwd = project_root .. "/opensource/agents/my-claude",
	tabs = {
		{ cmd = "cx", layout = "right_stack" },
		{ cmd = nil }, -- empty shell
	},
}
