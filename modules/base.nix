{ pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";

  networking.networkmanager.enable = true;

}
