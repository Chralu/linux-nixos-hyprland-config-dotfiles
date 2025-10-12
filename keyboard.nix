{ pkgs, ... }:

{
  services.xserver.xkb = {
    layout = "us";
    variant = "alt-intl";
  };
}
