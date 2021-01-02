{ config, pkgs, ... }:

{
  config = {
    environment.variables.CURRENT_SYSTEM_PROFILE = "test-profile";

    system = {
      greeter.lightdm.enable = true;
    };

    user.test = {
      groups = [ "wheel" ];
      uid = 1999;
      initialHashedPassword = "${config.local.secretsDir}/passwd_hash";
    };
  };

  imports = [ ../test_modules ];
}
