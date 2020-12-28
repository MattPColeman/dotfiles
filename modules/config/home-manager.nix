{ home-manager, config, ... }:
{
  home-manager = {
    useUserPackages = true;
    users.${config.local.username}.home.stateVersion = config.system.stateVersion;
  };
}
