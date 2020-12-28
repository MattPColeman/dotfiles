{ config, ... }:

with config;
{
  local.username = "matt";
  users.extraUsers.${local.username} = {
    isNormalUser = true;
    home="/home/${local.username}";
    extraGroups = ["wheel" "networkmanager" "input" "audio" "docker"];
    uid = 1000;
  };
}
