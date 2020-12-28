{ home-manager, ... }:

{
  home-manager.users.${config.local.username}.xdg.enable = true;
}
