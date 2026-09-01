-- WezTerm project definition. Override DOTFILES_PROJECT_ROOT when needed.
local project_root = os.getenv("DOTFILES_PROJECT_ROOT") or ((os.getenv("HOME") or "") .. "/IdeaProject")

return {
	workspace = "syncer",
	cwd = project_root .. "/starbucks/sdlc-cross-syncer",
	tabs = {
		{ cmd = "cx", layout = "right_stack" },
		{ cmd = "nvim" },
		{ cmd = nil }, -- empty shell
	},
}
