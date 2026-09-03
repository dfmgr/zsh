#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212103-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : WTFPL
# @ReadME        : systeminfo.zsh
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 21:03 EDT
# @File          : systeminfo.zsh
# @Description   : Show system info
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
showcputemp() {
  if [[ "$OSTYPE" != linux* ]]; then
    printf_warning "showcputemp is only supported on Linux"
    return 1
  fi
  awk -v t="$(</sys/class/thermal/thermal_zone0/temp)" 'BEGIN{print t/1000}'
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
showsysteminfo() {
  if [[ "$OSTYPE" != linux* ]]; then
    printf_warning "showsysteminfo is only supported on Linux"
    return 1
  fi
  local LIGHTRED=$'\e[91m'
  local NC=$'\e[0m'
  echo ""
  echo -e "\t\t${LIGHTRED}   CPU:$NC"
  sed -nr 's/model name[^:*]: (.*)/\t\t\t\1/p' /proc/cpuinfo
  echo -ne "\t\t${LIGHTRED}MEMORY:$NC\t"
  awk '/MemTotal/{mt=$2};/MemFree/{mf=$2};/MemAvail/{ma=$2}END{print "Total: "mt" | Free: "mf" | Available: "ma" (kB)"}' /proc/meminfo
  echo -ne "\t\t${LIGHTRED}    OS:$NC\t"
  lsb_release -cds | awk '{printf("%s ", $0)}'
  echo
  echo -ne "\t\t${LIGHTRED}KERNEL:$NC\t"
  uname -a | awk '{ print $3 }'
  echo -ne "\t\t${LIGHTRED}  ARCH:$NC\t"
  uname -m
  echo -ne "\t\t${LIGHTRED}UPTIME:$NC\t"
  uptime -p
  echo -ne "\t\t${LIGHTRED} USERS:$NC\t"
  w -h | awk '{if (!seen[$1]++) users=users $1" "}END{print users}'
  echo -ne "\t\t${LIGHTRED}  DISK:$NC"
  df -h | grep -E '/dev/(sd|nvme|mmcblk)|/mnt/' | awk '{print "\t"$0}'
  echo ""
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
showkernelgraph() {
  lsmod | perl -e 'print "digraph \"lsmod\" {";
                 <>;
                 while(<>){
                   @_=split/\s+/;
                   print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]
                 }
                 print "}"' | dot -Tsvg | rsvg-view-3 /dev/stdin
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
