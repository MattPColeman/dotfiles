{ options, lib, ... }:

with lib;
{
  options = with types; {
    users.users.${username} = {
      initialHashedPassword = mkAliasDefinitions options.user.${username}.initialHashedPassword;
      uid = mkAliasDefinitions options.user.${username}.uid;
      groups = mkAliasDefinitions options.user.${username}.groups;
    };
  };
}
