
# Setup uv
source $HOME/.local/bin/env
eval "$(uv generate-shell-completion bash)"

# Setup uv env activation completion
function _uv_env_completions() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W "$(ls ~/envs)" -- "$cur"))
}

complete -F _uv_env_completions ha

# Activate a uv environment
# under the ~/envs/ directory
function ha() {
    if [ -z "$1" ]; then
        echo "Environment name is required to activate."
        return 1
    fi

    local env_name="$1"
    local env_path="$HOME/envs/$env_name"

    if [ -d "$env_path" ]; then
        source "$env_path/bin/activate"
    else
        echo "Error: Environment '$env_name' does not exist in '$HOME/envs'"
        return 1
    fi
}
