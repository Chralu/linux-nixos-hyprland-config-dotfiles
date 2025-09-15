{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chralu = {
    isNormalUser = true;
    description = "chralu";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      vscodium
      firefox

      fractal # Matrix client

      marksman # LSP for markdown note taking

      # Video playback
      freetube 
      lnav # logs analysis
      jq   # json processing
      coreutils #base64 utils
      urlencode
    ];
  };

  # Change runtime directory size
  services.logind.settings.Login = {
    RuntimeDirectorySize="8G";
  };
}
