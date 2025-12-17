{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.wireshark.enable = true;
  users.users.charly = {
    isNormalUser = true;
    description = "charly";
    extraGroups = [
      "networkmanager"
      "wireshark"
      "input"
      "wheel"
      "video"
      "audio"
      "tss"
      "libvirtd"
      "vboxusers"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      vscodium
      firefox
      localsend

      fractal # Matrix client

      # Video playback
      freetube 
      # Music player
      termusic yt-dlp

      joplin-desktop     # notes taking
      alacritty
      
      hexyl      # Hexa viewer cli
    ];
  };

  # Localsend ports
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  # Change runtime directory size
  # services.logind.settings.Login = {
    # RuntimeDirectorySize="8G";
  # };
}
