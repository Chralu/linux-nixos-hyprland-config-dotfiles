{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.wireshark.enable = true;
  environment.systemPackages = with pkgs; [
    # Sniffing
    wireshark
    
    # Dev tools
    lnav # logs analysis
    jq   # json processing
    coreutils #base64 utils
    urlencode

    hexcurse   # Hexa editor

  ];
}
