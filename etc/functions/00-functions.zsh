#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 20:43 EDT
# @@File             :  00-functions.zsh
# @@Description      :  Shared printf/color helper functions used across the zsh dotfiles
# @@Changelog        :  Standardized header block to the new @@ template
# @@TODO             :
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  no
# @@Template         :  shell/zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck disable=all
# - - - - - - - - - - - - - - - - - - - - - - - -
VERSION="202609031423-git"
# Icons
ICON_INFO="[ ℹ️ ]"
ICON_GOOD="[ ✔ ]"
ICON_WARN="[ ❗ ]"
ICON_ERROR="[ ✖ ]"
ICON_QUESTION="[ ❓ ]"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Optimized: Use bright ANSI codes for better visibility on both dark and light backgrounds
# 90-97 range (bright colors)
printf_color() { printf "%b" "\e[9${2}m" "$1" "\e[0m"; }
printf_normal() { printf_color "\t\t$1\n" "7"; }
printf_green() { printf_color "\t\t$1\n" "2"; }
printf_red() { printf_color "\t\t$1\n" "1"; }
printf_purple() { printf_color "\t\t$1\n" "5"; }
printf_yellow() { printf_color "\t\t$1\n" "3"; }
printf_blue() { printf_color "\t\t$1\n" "4"; }
printf_cyan() { printf_color "\t\t$1\n" "6"; }
printf_info() { printf_color "\t\t$ICON_INFO $1\n" 3; }
printf_success() { printf_color "\t\t$ICON_GOOD $1\n" 2; }
printf_error() { printf_color "\t\t$ICON_ERROR $1 $2\n" 1; }
printf_warning() { printf_color "\t\t$ICON_WARN $1\n" 3; }
printf_error_stream() { while read -r line; do printf_error "↳ ERROR: $line"; done; }
printf_execute_success() { printf_color "\t\t$ICON_GOOD $1  \n" 2; }
printf_execute_error() { printf_color "\t\t$ICON_ERROR $1 $2 \n" 1; }
printf_execute_result() {
  if [ "$1" -eq 0 ]; then printf_execute_success "$2"; else printf_execute_error "$2"; fi
  return "$1"
}
printf_execute_error_stream() { while read -r line; do printf_execute_error "↳ ERROR: $line"; done; }

printf_exit() {
  test -n "$1" && test -z "${1//[0-9]/}" && local code="$1" && shift 1 || local code="1"
  local msg="$*"
  printf_color "\t\t$msg" "$code"
  echo ""
  exit "$code"
}

printf_help() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="4"
  local msg="$*"
  echo ""
  printf_color "\t\t$msg\n" "$color"
  echo ""
  return 0
}

printf_custom() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="5"
  local msg="$*"
  printf_color "\t\t$msg" "$color"
  echo ""
}

printf_pause() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="5"
  local msg="${*:-Press any key to continue}"
  printf_color "\t\t$msg " "$color"
  read -k 1 -s
  printf "\n"
}

printf_read() {
  setopt localoptions pipefail
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="6"
  while read -r line; do
    printf_color "\t\t$line" "$color"
  done
  printf "\n"
}

printf_readline() {
  setopt localoptions pipefail
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="6"
  while read -r line; do
    printf_color "\t\t$line\n" "$color"
  done
}

printf_question() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="4"
  local msg="$*"
  printf_color "\t\t$ICON_QUESTION $msg? " "$color"
}

printf_custom_question() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="1"
  local msg="$*"
  printf_color "\t\t$msg " "$color"
}

printf_answer() {
  local __var="${1:-__ANSWER}"
  read -s "$__var"
  print -s "${(P)__var}"
}

#printf_read_question "color" "message" "maxLines" "answerVar"
printf_read_question() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="1"
  local msg="$1" && shift 1
  local lines="${1:-120}" && shift 1
  local reply="${1:-__ANSWER}" && shift 1
  printf_color "\t\t$msg " "$color"
  printf_answer "$reply" "$lines"
}

printf_answer_yes() { [[ "${1:-$__ANSWER}" =~ ${2:-^[Yy]$} ]] && return 0 || return 1; }

printf_head() {
  test -n "$1" && test -z "${1//[0-9]/}" && local color="$1" && shift 1 || local color="6"
  local msg1="$1" && shift 1
  local msg2="$1" && shift 1 || msg2=
  local msg3="$1" && shift 1 || msg3=
  local msg4="$1" && shift 1 || msg4=
  local msg5="$1" && shift 1 || msg5=
  local msg6="$1" && shift 1 || msg6=
  local msg7="$1" && shift 1 || msg7=
  shift
  [ -z "$msg1" ] || printf_color "\t\t##################################################\n" "$color"
  [ -z "$msg1" ] || printf_color "\t\t$msg1\n" "$color"
  [ -z "$msg2" ] || printf_color "\t\t$msg2\n" "$color"
  [ -z "$msg3" ] || printf_color "\t\t$msg3\n" "$color"
  [ -z "$msg4" ] || printf_color "\t\t$msg4\n" "$color"
  [ -z "$msg5" ] || printf_color "\t\t$msg5\n" "$color"
  [ -z "$msg6" ] || printf_color "\t\t$msg6\n" "$color"
  [ -z "$msg7" ] || printf_color "\t\t$msg7\n" "$color"
  [ -z "$msg1" ] || printf_color "\t\t##################################################\n" "$color"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# use grc if it's installed or execute the command direct
if (( $+commands[grc] )); then
  if [[ "$USEGRC" = "yes" ]]; then
    grc() { command grc --colour=on "$@"; }
  fi
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# generate random strings
if (( ! $+commands[random-string] )); then
  random-string() {
    tr -dc 'a-zA-Z0-9' </dev/urandom | fold -w "${1:-64}" | head -n 1
  }
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (( ! $+commands[mkpasswd] )); then
  mkpasswd() {
    tr -dc '[:print:]' </dev/urandom | tr -d '[:space:]\042\047\134' | fold -w "${1:-64}" | head -n 1
  }
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# the fuck
fuck() {
  TF_CMD=$(
    TF_ALIAS=fuck \
      PYTHONIOENCODING=utf-8 \
      TF_SHELL_ALIASES=$(alias) \
      thefuck "$(fc -ln -1)"
  ) && eval "$TF_CMD" && print -s "$TF_CMD"
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set OS TYPE (lazy — call detectos manually when $OS is needed)
detectos() {
  case "$OSTYPE" in
  linux*) OS='Linux' ;;
  freebsd*) OS='FreeBSD' ;;
  cygwin* | msys* | mingw*) OS='Windows' ;;
  darwin*) OS='Mac' ;;
  solaris*) OS='Solaris' ;;
  aix* | *) ;;
  esac
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#Set OS Detection (lazy — call detectostype manually when $DISTRO is needed)
detectostype() {
  local arch="$CPUTYPE"
  local kernel=$(uname -r)
  local distroname
  local CODENAME
  if [ -n "$(command -v lsb_release)" ]; then
    distroname=$(lsb_release -s -d)
  elif [ -f "/etc/os-release" ]; then
    distroname=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
  elif [ -f "/etc/debian_version" ]; then
    distroname="Debian $(</etc/debian_version)"
  elif [ -f "/etc/redhat-release" ]; then
    distroname=$(</etc/redhat-release)
  else
    distroname="$(uname -s) $(uname -r)"
  fi
  #Various Arch Distros
  if [[ "$distroname" =~ "ArcoLinux" ]] || [[ "$distroname" =~ "Arch" ]] || [[ "$distroname" =~ "BlackArch" ]]; then
    DISTRO=Arch
  #Raspberry pi
  elif [[ "$distroname" =~ "Raspbian" ]]; then
    DISTRO=Raspbian
  #Various RedHat Distros
  elif [[ "$distroname" =~ "Scientific" ]] || [[ "$distroname" =~ "RedHat" ]] || [[ "$distroname" =~ "CentOS" ]] || [[ "$distroname" =~ "Casjay" ]]; then
    DISTRO=RHEL
  #Various Debian Distros
  elif [[ "$distroname" =~ "Kali" ]] || [[ "$distroname" =~ "Parrot" ]] || [[ "$distroname" =~ "Debian" ]]; then
    DISTRO=Debian
    if [[ "$distroname" =~ "Debian" ]]; then
      CODENAME=$(lsb_release -a 2>/dev/null | grep Code | sed 's#Codename:##g' | awk '{print $1}')
    fi
    if [[ "$distroname" =~ "Kali" ]]; then
      CODENAME=kali
    fi
    if [[ "$distroname" =~ "Parrot" ]]; then
      CODENAME=parrot
    fi
  elif [[ "$distroname" =~ "Ubuntu" ]] || [[ "$distroname" =~ "Mint" ]] || [[ "$distroname" =~ "Elementary" ]] || [[ "$distroname" =~ "KDE neon" ]]; then
    DISTRO=Ubuntu
    CODENAME=$(lsb_release -a 2>/dev/null | grep Code | sed 's#Codename:##g' | awk '{print $1}')
  elif [[ "$distroname" =~ "Fedora" ]]; then
    DISTRO=Fedora
  fi
  if [ -f /etc/os-release ]; then
    DISTROID="$(grep ID_LIKE /etc/os-release | sed 's/^.*=//')"
  fi
}
