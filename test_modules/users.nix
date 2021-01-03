{ config, home-manager, lib, options, ... }:

/* let
  mkUserOpts = { name, ... }: {
    options.user = mkAliasDefinitions options.users.users.${name};
    };
  };
in */
with lib;
{

  options.user = mkAliasDefinitions options.users.users;
   /* {
      default = {};
      type = with types; attrsOf (submodule mkUserOpts);
    }; */

  config = {
    security.sudo.wheelNeedsPassword = false;
    users.mutableUsers = false;
  };
}
