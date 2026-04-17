{ pkgs, ... }:

{
  users.users.lewis = {
    isNormalUser = true;
    description = "Lewis";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
