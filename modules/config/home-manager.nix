{ home-manager, config, ... }:

{
  home-manager = with config; {
    useUserPackages = true;
    users.${local.username} = {
      xdg.enable = true;
      home.stateVersion = system.stateVersion;
    };
  };
}
