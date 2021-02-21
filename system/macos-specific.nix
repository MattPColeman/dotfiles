{ config, pkgs, ... }:

{
    imports = [ ./common.nix ];
    # users.groups.nixbld.members = [ "matt.coleman" ]; # doesn't work - maybe need to specify allowing matt.coleman to be managed?
}
