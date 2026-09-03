#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : 202103212043-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : WTFPL
# @ReadME        : getip.zsh
# @Copyright     : Copyright: (c) 2021 Jason Hempstead, CasjaysDev
# @Created       : Sunday, Mar 21, 2021 20:43 EDT
# @File          : getip.zsh
# @Description   : Get current IP Address
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unset NETDEV IFISONLINE CURRIP4 CURRIP6 CURRIP4WAN CURRIP6WAN
__getip() {
  NETDEV="$(ip route | awk '/default/ {print $5; exit}')"
  if [[ -n "$NETDEV" ]]; then
    CURRIP4="$(ip -o -4 addr show "$NETDEV" | awk '{split($4,a,"/"); print a[1]; exit}')"
    CURRIP6="$(ip -o -6 addr show "$NETDEV" scope global | awk '!/docker/{split($4,a,"/"); print a[1]; exit}')"
    timeout 0.3 ping -c1 8.8.8.8 &>/dev/null && IFISONLINE=0 || IFISONLINE=1
    if [[ "$IFISONLINE" = 0 ]]; then
      CURRIP4WAN="$(curl -4qs --max-time 2 ifconfig.co/ip 2>/dev/null)"
      CURRIP6WAN="$(curl -6qs --max-time 2 ifconfig.co/ip 2>/dev/null)"
    fi
    [[ -z "$CURRIP4" ]] || echo "$CURRIP4"
    [[ -z "$CURRIP6" ]] || echo "$CURRIP6"
    [[ -z "$CURRIP4WAN" ]] || echo "$CURRIP4WAN"
    [[ -z "$CURRIP6WAN" ]] || echo "$CURRIP6WAN"
    unset NETDEV IFISONLINE CURRIP4 CURRIP6 CURRIP4WAN CURRIP6WAN
  fi
}
#---------------------------------------------------------------------------------------
