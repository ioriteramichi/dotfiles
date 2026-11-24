{ config, lib, ... }:

{
  options.dotfiles.programs.direnv.enable = lib.mkEnableOption "direnv";

  config = lib.mkIf config.dotfiles.programs.direnv.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      config.global.warn_timeout = "30s";
    };
  };
}
