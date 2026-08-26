{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dotfiles.programs.claude-code.enable = lib.mkEnableOption "Claude Code";

  config = lib.mkIf config.dotfiles.programs.claude-code.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "claude-code" ];

    home.packages = [ pkgs.claude-code ];
  };
}
