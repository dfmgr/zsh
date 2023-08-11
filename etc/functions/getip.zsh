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
unset IFCONFIG NETDEV IFISONLINE CURRIP4 CURRIP6 CURRIP4WAN CURRIP6WAN
__getip() {
  IFCONFIG="$(sudo bash -c "command -v ifconfig 2>/dev/null")"
  if [ ! -z "$IFCONFIG" ]; then
    NETDEV="$(ip route | grep default | sed -e 's/^.*dev.//' -e 's/.proto.*//')"
    CURRIP4="$(sudo ifconfig $NETDEV | grep -E 'venet|inet' | grep -v '127.0.0.' | grep inet | grep -v 'inet6' | awk '{print $2}' | sed 's#addr:##g' | head -n1)"
    CURRIP6="$(sudo ifconfig $NETDEV | grep -E 'venet|inet' | grep -v 'docker' | grep inet6 | grep -i 'global' | awk '{print $2}' | head -n1)"
    IFISONLINE="$(
      timeout 0.3 ping -c1 8.8.8.8 &>/dev/null
      echo $?
    )"
    if [ "$IFISONLINE" = 0 ]; then
      CURRIP4WAN="$(
        curl -I4qs ifconfig.co/ip 2>/dev/null | head -1 | grep 404 >/dev/null
        if [ "$?" = 0 ]; then curl -4qs ifconfig.co/ip 2>/dev/null; fi
      )"
      CURRIP6WAN="$(
        curl -I6qs ifconfig.co/ip 2>/dev/null | head -1 | grep 404 >/dev/null
        if [ "$?" = 0 ]; then curl -6qs ifconfig.co/ip 2>/dev/null; fi
      )"
    fi
    [ -z "$CURRIP4" ] || echo $CURRIP4
    [ -z "$CURRIP6" ] || echo $CURRIP6
    [ -z "$CURRIP4WAN" ] || echo $CURRIP4WAN
    [ -z "$CURRIP6WAN" ] || echo $CURRIP6WAN
    unset IFCONFIG NETDEV IFISONLINE CURRIP4 CURRIP6 CURRIP4WAN CURRIP6WAN
  fi
}
#---------------------------------------------------------------------------------------
