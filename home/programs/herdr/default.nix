{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dotfiles.programs.herdr.enable = lib.mkEnableOption "herdr";

  config = lib.mkIf config.dotfiles.programs.herdr.enable {
    home.packages = [ pkgs.herdr ];
  };
}
