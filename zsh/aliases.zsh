# Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -l'
alias lsfull="ls -halF"

alias grep='grep --color=always'

alias rake='noglob rake'
alias bower='noglob bower'
# alias git='hub'

alias psfull="ps auxfe"

alias netstatl="netstat -lnptu"
alias lsofil="lsof -i -n | egrep 'COMMAND|LISTEN'"
alias nmap-discover='sudo nmap -PR -sP 192.168.1.0/24'
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

alias -g clip='| xclip -selection clipboard'
alias -g gi=' | grep -i  '

alias -s html='firefox'
alias -s log='less -MN'
alias -s md=subl
alias -s txt=subl

alias docker-rmi-none="sudo docker rmi \`sudo docker images | grep none | cut -f1 -d$'\t'\`"
