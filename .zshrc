(cat ~/.cache/wal/sequences &)                # pywal colortheme on load

# If you come from bash you might have to change your $PATH.
export PATH=/usr/bin:/usr/sbin:/bin:/sbin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH=$PATH:/usr/local/git/bin:/usr/local/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=$PATH:~/.nexustools

# ZSH PATH
export ZSH=/Users/Simeon/.oh-my-zsh

# ZSH_THEME="HUH"
ZSH_THEME="common"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  #git 
  zsh-autosuggestions
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# graphical customizaion
# PROMPT='[$fg[red]%~%{$reset_color%}] '   # custom prompt'
# PROMPT='[$(t | wc -l | sed -e"s/ *//")] in %~% -> '
# PROMPT='%~ -> '

# personal
function macfeh() { open -b 'drabweb.macfeh' "$@"; }                      # macfeh image viewer
function luv() {                                                          # opens pic of <3 in machfeh
    pic_path=$(find /Users/Simeon/Pictures/Teah -type f | gshuf -n 1);
    macfeh $pic_path;
}

alias wd='wal -q -i /Users/Simeon/Google\ Drive/Creative/Wallpapers'                          # wallpaper change
alias wl='wal -q -l -i  /Users/Simeon/Google\ Drive/Creative/Wallpapers'                      # light wallpaper change
alias wfd='wal -q -i /Users/Simeon/Google\ Drive/Creative/Wallpapers/1872328570.jpg'
alias wfl='wal -q -l -i /Users/Simeon/Google\ Drive/Creative/Wallpapers/1872328570.jpg'
alias msc='ncmpcpp'                                                                           # music and scrobbling
alias beeti='loadpyenv && pyenv shell 3.6.5 && beet import -A /Users/Simeon/Desktop/ && mpc update'                             # beet import music from desktop
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'                           # dotfiles git folder
alias t='nocorrect python /usr/local/bin/sjl-t/t.py --task-dir ~/Notes/Tasks --list tasks'    # todo list
alias b='nocorrect python /usr/local/bin/sjl-t/t.py --task-dir $(pwd) --list bugs'            # bugs list
alias v='nvim'                                                                                # open neovim like vim
alias warrp='warriorjs --time .05'                                                            # faster warriorjs
alias warre='v ~/WarriorJS/luv-beginner/Player.js'                                            # edit warrior.js
alias budget='v ~/Google\ Drive/Temporary/Budget.md'                                          # open my budget
alias projects='cd ~/Documents/Projects'                                                      # open project folder
alias storymap=' cd ~/Documents/Projects/StoryMapJS/'                                         # open storymapjs folder

# tool loaders
alias loadnvm='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
alias loadenv='export WORKON_HOME=$HOME/.virtualenvs && export PROJECT_HOME=$HOME/Devel && source /usr/local/bin/virtualenvwrapper.sh'
alias loadpyenv='eval "$(pyenv init -)"'

# alias
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

# networking
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

t
