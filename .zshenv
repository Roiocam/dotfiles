
[[ -f "$HOME/.flow-engine/session.env" ]] && source "$HOME/.flow-engine/session.env"

# QODER_DISPATCHER_PATH v1
path=("$HOME/.qoder/entry" ${path:#"$HOME/.qoder/entry"})
export PATH
# END QODER_DISPATCHER_PATH v1
