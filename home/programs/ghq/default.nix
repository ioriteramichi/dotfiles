{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dotfiles.programs.ghq.enable = lib.mkEnableOption "ghq";

  config = lib.mkIf config.dotfiles.programs.ghq.enable {
    home.packages = [ pkgs.ghq ];
  };
}
