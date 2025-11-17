{ pkgs, ... }:
{
  services.displayManager.sddm = {
   enable = true;
   theme = "breeze";
   wayland.enable = true;
   enableHidpi = true;
  };
  services.xserver.desktopManager.plasma6.enable = true;
  # environment.plasma6.excludePackages = with pkgs; [
    
  # ];
}
