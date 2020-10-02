#
# Set locale correctly
if [[ -z "$LC_ALL" ]]; then
  export LANG='en_GB.UTF-8'
  export LC_ALL='en_GB.UTF-8'
fi

# Colour setup
autoload -U colors && colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
        eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
        eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

# Customise command prompt
set_prompt () {
#        Last_Command=$? # Must come first!

        # Add a white exit status for the last command
        PROMPT="${MAGENTA}%* "
        # If it was successful, print a green check mark. Otherwise, print
        # a red X.
        #if [[ $Last_Command == 0 ]]; then
        #        PROMPT+="$BGreen$Checkmark "
        #else
        #        PROMPT+="$BRed$FancyX "
        #fi
        # If root, just print the host in red. Otherwise, print the current user
        # and host in green.
        if [[ $EUID == 0 ]]; then
                PROMPT+="${RED} "
        else
                PROMPT+="${GREEN}%n "
        fi
        # Print the working directory and prompt marker in blue, and reset
        # the text color to the default.
        PROMPT+="${YELLOW} ${CYAN}%~ ${BOLD_GREEN}\$${RESET} "
}
precmd() {set_prompt ; }

# Aliases
alias vim='nvim'
alias vimdiff='nvim -d'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ls='ls -G'
alias l='ls -Grlt'
alias la='ls -Ga'
alias l.='ls -Gd .*'
alias ll='ls -Gl'
alias clc='clear; l'
alias rm='rm -f'
alias ftags='ctags --fortran-kinds=+i *.f'      # fortran tags 
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# Fzf quick cd
fd() {
        local dir
        dir=$(find ${1:-.} -path '*/\.*' -prune \
                -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
