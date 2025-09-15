#!/usr/bin/env sh

RED='\033[0;31m'
YELLOW='\033[0;33m'
DARK_GRAY='\033[90m'
LIGHT_CYAN='\033[0;96m'
DARK_CYAN='\033[0;36m'
NO_COLOR='\033[0m'
BOLD='\033[1m'

# =========
# Logging
# =========

error() {
    printf '%b\n' " - [${DARK_GRAY}$(date +'%m/%d/%y %H:%M:%S')${NO_COLOR}] ${RED}${BOLD}<Error>${NO_COLOR}: ${RED}$1${NO_COLOR}"
}

info() {
    printf '%b\n' " - [${DARK_GRAY}$(date +'%m/%d/%y %H:%M:%S')${NO_COLOR}] ${DARK_CYAN}${BOLD}<Info>${NO_COLOR}: ${DARK_CYAN}$1${NO_COLOR}"
}

warning() {
    printf '%b\n' " - [${DARK_GRAY}$(date +'%m/%d/%y %H:%M:%S')${NO_COLOR}] ${YELLOW}${BOLD}<Warning>${NO_COLOR}: ${YELLOW}$1${NO_COLOR}"
}

prepare_bak_dir() {
  info "Prepare backup dir :"
  tmp_backup_dir="$(mktemp -d)"
  readonly tmp_backup_dir
  info "\t> $tmp_backup_dir"
}

apply_nixos_conf() {
  info "Applying nixos conf"
  sudo cp -a /etc/nixos "$tmp_backup_dir" &&\
  info "\t> previous conf backed up in $tmp_backup_dir" &&\
  sudo find /etc/nixos -type f -not -name 'hardware-configuration.nix' -delete &&\
  sudo cp nixos/* /etc/nixos/
  info "\t> new config applied"
}

revert_nixos_conf() {
  error "Error occured. Reverting previous config"
  sudo cp -a "$tmp_backup_dir" /etc/nixos
}


prepare_bak_dir &&\
(apply_nixos_conf || revert_nixos_conf)
 
