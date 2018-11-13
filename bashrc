# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#Definiendo ruta de tools
PathTools='/home/pi/Desktop/tools'

# Paths
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias apagar='sudo shutdown -h now'
alias blueHydra='sudo $PathTools/blue_hydra/bin/blue_hydra'
alias getSploit='python $PathTools/getsploit/getsploit/getsploit.py'
alias toolstpx='cat ~/.toolstpx'
alias updateLab='/home/pi/.updateLab.sh'
alias sudo='sudo '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#########################################
# Funcion de carga, da tiempo al curl.
# Apartir de aquí pa abajo son 
# modificaciones de tpx
#########################################

function cargandopath()
   {
echo -ne '\n'
echo -ne ' | tpx0000x0x0x0as98                                      (5%)\r'
sleep .3
echo -ne ' / tpx0x909x09asd000000d0w1                               (10%)\r'
sleep .3
echo -ne ' - tpx0x09x09asd0wn8asd8as8d00010                         (15%)\r'
sleep .5
echo -ne ' \ tpx0a500a989asd0dnloadera7sd0104010                    (25%)\r'
sleep .3
echo -ne ' | tpx0x50asd89a7as90d81200x0x90912a0104010               (55%)\r'
sleep .2
echo -ne ' / tpx10x0sa9dax0129sd090x0x09ad90asd0a89s09zx0asd        (78%)\r'
sleep .3
echo -ne '   tpx Lab 2019 v.1 is  Ready !!                         (100%) \r'
echo -ne '\n'
sleep 1

   }

cargandopath

sleep 2

echo " Cargando Sistema ... "

sleep 1

clear

#Banner cohete tpx
source /home/pi/.login_tpx
sleep 2

cd /home/pi/Desktop/tools;

BWhite='\e[1;37m'       # White

echo -e "$BWhite [+] Herramientas Locales en:  \033[0m"
echo -e "$BWhite  |- - - \e[31m\033[33;5;7m$PathTools:\033[0m"
ls
echo -e "$BWhite [!] \033[0mherramientas preinstaladas, teclee ${BRed}toolstpx  \033[0m"
