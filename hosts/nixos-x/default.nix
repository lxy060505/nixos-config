{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix

    ../../modules/base.nix
    ../../modules/nix.nix
    ../../modules/users.nix
    ../../modules/desktop.nix
  ];

  networking.hostName = "nixos-x";

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
