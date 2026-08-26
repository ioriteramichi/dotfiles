{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dotfiles.programs.codex.enable = lib.mkEnableOption "Codex CLI";

  config = lib.mkIf config.dotfiles.programs.codex.enable {
    home.packages = [ pkgs.codex ];
  };
}
