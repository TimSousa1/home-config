# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default config
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

alias r='ranger'
alias grep='grep --color=auto'
alias qwer='~/.scripts/keyboard_setup.sh && ~/.scripts/mouse_setup.sh'


# custom commands
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

pdfall() {
    for file in $1/*; do
        zathura $file &
    done;
}

# command output to clipboard
alias c='xclip -selection clipboard'
alias pc='pwd | c'
alias bat='bat --theme="Catppuccin-mocha"'

# video configs
alias scrr='~/.scripts/monitor_setup.sh "--rotate left" && qtile cmd-obj -o cmd -f reload_config && nitrogen --restore'
alias scrn='~/.scripts/monitor_setup.sh "--rotate normal" && qtile cmd-obj -o cmd -f reload_config && nitrogen --restore'
alias md='autorandr --change --skip-option crtc && qtile cmd-obj -o cmd -f reload_config && nitrogen --restore'

secmon() {
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --$1 eDP-1-2
}

alias smr='secmon right-of'
alias sml='secmon left-of'

# Load version control information
#autoload -Uz vcs_info
#precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:git:*' formats '%F{yellow}( %b)%f'

#setopt PROMPT_SUBST
#PS1='%B%F{brblack}[%F{red}%n%f@%F{magenta}%m %F{cyan}%~%F{brblack}]${vcs_info_msg_0_}%F{green}$ %f%b' 


export __GL_SYNC_DISPLAY_DEVICE=DP-1

export EDITOR=nvim

export QT_QPA_PLATFORMTHEME=qt5ct 

# adding android tools to path
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# adding CUDA to path
export PATH="/opt/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"

# adding the VULKAN SDK to path
export VULKAN_SDK=~/vulkan/1.3.243.0/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d

# ollama
export OLLAMA_MODELS=$HOME/mnt/drive2/ollama

export R_LIBS_USER="/home/tim/x86_64-pc-linux-gnu-library/4.4"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
