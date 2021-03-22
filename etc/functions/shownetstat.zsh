#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212103-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.com
# @License       : WTFPL
# @ReadME        : shownetstat.zsh --help
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 21:03 EDT
# @File          : shownetstat.zsh
# @Description   : Monitors the network activity
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
shownetstat() {
  #  watch --color -tn1 sudo grc 'netstat -tuapn4|tail -n+3|grep -v "\(systemd-resolv\|FIN_WAIT1\|FIN_WAIT2\|TIME_WAIT\\)"'
  #  watch --color -tn1 sudo grc 'netstat -tuapn|tail -n+3|grep -v "\(systemd-resolv\|cupsd\|FIN_WAIT1\|FIN_WAIT2\|TIME_WAIT\\)"'
  #  watch --color -tn1 sudo grc 'ss -tuapn4|tail -n+2|grep -v "\(systemd-resolv\|cupsd\|FIN_WAIT1\|FIN_WAIT2\|TIME_WAIT\\)"'
  #  watch --color -tn1 sudo grc 'ss -tuapn4|tail -n+2|grep -v "\(systemd-resolv\|FIN_WAIT1\|FIN_WAIT2\|TIME_WAIT\\)"'
  watch --color -tn1 sudo grc 'ss -tuapn | awk '\''{if(NR>1){if(0==match($0,/systemd-resolv|FIN-WAIT-1|FIN-WAIT-2|TIME-WAIT|LAST-ACK|SYN-SENT/)){gsub(/\s+/," ");gsub(/users\:\(\(|\)\)/,"");;print}}}'\'
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
