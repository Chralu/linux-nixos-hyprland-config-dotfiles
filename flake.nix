{
  description = "XNM's NixOS Configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations.bagage = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        # ./clamav-scanner.nix
        ./sound.nix
        ./usb.nix
        ./keyboard.nix
        ./time.nix
        ./swap.nix
        ./bootloader.nix
        ./nix-settings.nix
        ./nixpkgs.nix
        # ./gc.nix
        # ./auto-upgrade.nix
        ./linux-kernel.nix
        ./theme.nix
        ./internationalisation.nix
        ./fonts.nix
        # ./security-services.nix
        ./services.nix
        ./gnome.nix
        ./networking.nix
        # ./mac-randomize.nix
        # ./clamav-scanner.nix
        ./firewall.nix
        ./dns.nix
        # ./vpn.nix
        ./users.nix
        ./virtualisation.nix
        ./programming-languages.nix
        ./terminal-utils.nix
        # ./llm.nix
        ./security-services.nix
      ];
    };
  };
}
