alias ll='ls -l'
alias grep='grep --color=always'
alias rake='noglob rake'
alias bower='noglob bower'
# alias git='hub'

# Rich output aliases
alias psfull="ps auxfe"
alias lsfull="ls -halF"

alias netstatl="netstat -lnptu"
alias lsofil="lsof -i -n | egrep 'COMMAND|LISTEN'"
alias nmap-discover='sudo nmap -PR -sP 192.168.1.0/24'
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

alias docker-rmi-none="sudo docker rmi \`sudo docker images | grep none | cut -f1 -d$'\t'\`"

if [[ $CURRENT_OS == 'OS X' ]]; then
elif [[ $CURRENT_OS == 'Linux' ]]; then
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
fi

# TODO some aliases should be functions