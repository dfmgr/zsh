#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202609031423-git
# @@Author           :  Jason Hempstead
# @@Contact          :  git-admin@casjaysdev.pro
# @@License          :  WTFPL
# @@ReadME           :  README.md
# @@Copyright        :  Copyright: (c) 2021 Jason Hempstead, Casjays Developments
# @@Created          :  Sunday, Mar 21, 2021 21:08 EDT
# @@File             :  zz-welcome.zsh
# @@Description      :  Shows an initial welcome message
# @@Changelog        :  Standardized header block to the new @@ template
# @@TODO             :
# @@Other            :
# @@Resource         :
# @@Terminal App     :  no
# @@sudo/root        :  yes
# @@Template         :  shell/zsh
# - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck disable=all
# - - - - - - - - - - - - - - - - - - - - - - - -
VERSION="202609031423-git"
show_welcome() {
  if [ ! -f "$HOME/.config/zsh/welcome.msg" ]; then
    printf_green "Welcome to your system!"
    printf_green "It would appear that it"
    printf_green "has been setup successfully."
    printf_green "The .sample files can be edited"
    printf_green "and renamed as they wont be"
    printf_green "overwritten on any updates."
    printf_green "If you configured tor you can run"
    printf_green "the command show_welcome_tor"
    printf_green "\n"
    printf_question "Show this message again"
    printf_answer
    printf "\n"
    if ! printf_answer_yes; then
      touch "$HOME/.config/zsh/welcome.msg"
    fi
  fi
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
show_welcome_tor() {
  if [ ! -f "$HOME/.config/zsh/welcome_tor.msg" ]; then
    if [ ! -f /usr/local/etc/tor/install.sh ]; then
      printf_info "The tor package has not been installed"
      printf_green "You can install it by running dotfiles install tor"
    else
      if (sudo -vn && sudo -ln) 2>&1 | grep -v 'may not' >/dev/null; then
        if sudo bash -c '[ -f /var/lib/tor/hidden_service/hostname ]'; then
          printf_green "the tor hostname of this system is:"
          printf_green "$(sudo cat /var/lib/tor/hidden_service/hostname)"
          printf_info "The hostname has been saved to $HOME/tor_hostname"
          sudo cat /var/lib/tor/hidden_service/hostname >"$HOME/tor_hostname"
          printf_question "Show this message again"
          printf_answer
          printf "\n"
          if ! printf_answer_yes; then
            touch "$HOME/.config/zsh/welcome_tor.msg"
          fi
        fi
      fi
    fi
  fi
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
