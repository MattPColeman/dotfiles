{ config, pkgs, ... }:

{
  # Fixes stutter whenever audio resumes.
  environment.extraInit = ''
    xset s off -dpms
  '';
}
