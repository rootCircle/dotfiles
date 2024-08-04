# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

export EDITOR="nvim"
export CC=/usr/bin/clang
export LOCAL_CFLAGS="-fsanitize=integer -fsanitize=undefined -ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LOCAL_LDLIBS="-lcrypt -lcs50 -lm"
export CXX=/usr/bin/clang++
export LOCAL_CXXFLAGS="-fsanitize=integer -fsanitize=undefined -ferror-limit=1 -gdwarf-4 -ggdb3 -O0 -Wall -Werror -Wextra -Wno-gnu-folding-constant -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export RANGER_LOAD_DEFAULT_RC=false # To load custom ranger config

alias make="CFLAGS=\"$LOCAL_CFLAGS\" LDLIBS=\"$LOCAL_LDLIBS\" CXXFLAGS=\"$LOCAL_CXXFLAGS\" \make"
alias diff=colordiff
alias c=clear
alias C=clear
# alias act_conda='bash --rcfile ~/.conda.bashrc'
alias ccr='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'
alias revtet=gnirehtet
alias rnew='cd .. && read name && cargo init $name && cd $name && code . && code src/main.rs'
alias update='sudo sh -c "cowsay pacman; pacman -Syu; cowsay flatpak; flatpak update;"; cowsay yay; yay -Syu; cowsay rust; rustup update; cowsay zim; zimfw update; zimfw upgrade; cowsay "TGPT"; sudo tgpt -u; cowsay auto-cpufreq; sudo auto-cpufreq --update; cowsay rye; rye self update;'
alias ficd='source ~/Scripts/findAndcdIntoDir.sh'
alias whatsapp="firefox -P Whatsapp web.whatsapp.com"
alias cat="bat --theme=OneHalfDark"
alias ls="exa --icons --hyperlink --binary --git --git-repos"
alias magic='cd "/run/media/$(whoami)/Media/Explorer/Coding/"'
alias deleteELF="fd -tf -X file | grep '\bELF\b' | cut -d: -f1 | xargs rm -i"
alias maintain="flatpak uninstall --unused && sudo flatpak repair && sudo pacman -Scc && yay -Scc && paru -Scc && sudo journalctl --vacuum-size=50M && kondo --older 10d -d ~/Documents/Coding && cargo cache -a && sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches' && nix-collect-garbage && podman system prune --all --volumes"
alias docker="echo Using Podman; podman"
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias brg="batgrep"
export GPG_TTY=\$(tty)

eval "$(zoxide init zsh)"
eval "$(cargo shuttle generate shell zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/$(whoami)/.bun/_bun" ] && source "/home/$(whoami)/.bun/_bun"
source "$HOME/.rye/env"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="/home/$(whoami)/.avm/bin:$BUN_INSTALL/bin:$HOME/go/bin:/usr/bin:$PATH:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin"

# To enable nvm, uncomment this
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(_AUTO_CPUFREQ_COMPLETE=zsh_source auto-cpufreq)"

# pnpm
export PNPM_HOME="/home/$(whoami)/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# android
export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME='/home/violow/Android/Sdk/ndk/27.0.12077973/'
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

eval `ssh-agent` >| /dev/null 2>&1 

########################################
## Beauty prompt at start
#######################################
figlet -ct "rootCircle" | lolcat
fortune -s | cowsay -W $(($(tput cols) / 3)) | lolcat
pokemon-colorscripts --no-title -r 1,3,6
# ponsay
eval "$(starship init zsh)"

# echo "Enter Password for GitHub SSH"
# ssh-add

eval $(thefuck --alias)
