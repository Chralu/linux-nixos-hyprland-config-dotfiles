{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.wireshark.enable = true;
  users.users.chralu = {
    isNormalUser = true;
    description = "chralu";
    extraGroups = [ "networkmanager" "wireshark" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      vscodium
      firefox

      fractal # Matrix client

      marksman # LSP for markdown note taking

      # Video playback
      freetube 

      # Sniffing
      wireshark
      linux-wifi-hotspot
      
      # Dev tools
      lnav # logs analysis
      jq   # json processing
      coreutils #base64 utils
      urlencode

      hexyl      # Hexa viewer cli
      hexcurse   # Hexa editor

    ];
  };

  # Change runtime directory size
  services.logind.settings.Login = {
    RuntimeDirectorySize="8G";
  };
}
