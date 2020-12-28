{ home-manager, config, ... }:

{
  home-manager.users.${config.local.username}.xdg.enable = true;
}
