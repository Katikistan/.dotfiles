# General env
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESS='-R'

# Compiler defaults
export CC=clang
export CXX=clang++
export CFLAGS="-O0 -g3 -fno-omit-frame-pointer"
export CXXFLAGS="$CFLAGS"
# Better stack traces
export ASAN_OPTIONS="abort_on_error=1:disable_coredump=0"
export LLDB_USE_COLOR=1
export LLDB_EDITOR=nvim
export GDBHISTFILE="$HOME/.gdb_history"

# Paths
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker zsh-autosuggestions)

[ -f $ZSH/oh-my-zs.sh ] && source $ZSH/oh-my-zsh.sh

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
