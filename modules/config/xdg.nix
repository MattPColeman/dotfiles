{ config, home-manager, ... }:
{
  # unused
  home-manager.users.${config.local.username}.xdg.enable = true;
}
