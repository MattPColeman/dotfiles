{ config, pkgs, ... }:

let
  user = config.users.users;
in
{
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "test-profile";

    system = {
      greeter.lightdm.enable = true;
    };

    user.test = {
      extraGroups = [ "wheel" ];
      uid = 1999;
      initialHashedPassword = "";
    };
  };

  imports = [ ../test_modules ];
}
