{ pkgs, hostName, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./neovim.nix
    ./ssh.nix
  ];

  home.username = "lewis";
  home.homeDirectory = "/home/lewis";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    swaybg
    wget
    xwayland-satellite
    fastfetch
    tree
  ];

  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;

  xdg.configFile."niri/config.kdl".source = ../modules/niri/config.kdl;
}
