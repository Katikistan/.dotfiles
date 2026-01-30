# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# General env
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESS='-R'

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose nmap rust golang)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	 export EDITOR='nvim'
else
	export EDITOR='vim'
fi

# Compilation flags
export CC=clang
export CXX=clang++
export CFLAGS="-O0 -g3 -fno-omit-frame-pointer"
export CXXFLAGS="$CFLAGS"

# Better stack traces
export ASAN_OPTIONS="abort_on_error=1:disable_coredump=0"
export LLDB_USE_COLOR=1
export LLDB_EDITOR=nvim
export GDBHISTFILE="$HOME/.gdb_history"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

alias ll='ls -lah'
alias gs='git status'

# Use ripgrep interactively
alias rg='rg --smart-case'

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust (cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# Ghidra
# export PATH="$HOME/tools/ghidra_10.3.4_PUBLIC:$PATH"

alias ghidra="ghidraRun"

# Cutter
alias cutter="$HOME/tools/cutter/cutter"
