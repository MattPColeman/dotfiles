{ config, pkgs, ... }:

{
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "test-profile";

    system = {
      greeter.lightdm.enable = true;
    };

    users.users.test = {
      extraGroups = [ "wheel" ];
      uid = 1999;
      initialHashedPassword = "test";
    };
  };

  imports = [ ../test_modules ];
}
