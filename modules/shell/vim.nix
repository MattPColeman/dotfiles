{ options, config, pkgs, lib, ... }:

with lib; let cfg = config.modules.shell.vim; in
{
  options.modules.shell.vim.enable = mkEnableOption "vim";
  
  config = {
    environment.systemPackages = [ pkgs.neovim ];
    modules.shell.zsh.aliasFiles = [ "${config.local.configDir}/vim/aliases.sh" ];
  };
}
