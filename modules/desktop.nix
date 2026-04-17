{ config, pkgs, home-manager, hostName, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "zh-CN"
    ];
  };

  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
	      user = "lewis";
      };
    };
  };

  fonts.packages = with pkgs;[
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
