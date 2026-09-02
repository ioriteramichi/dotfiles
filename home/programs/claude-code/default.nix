{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.dotfiles.programs.claude-code.enable = lib.mkEnableOption "Claude Code";

  config = lib.mkIf config.dotfiles.programs.claude-code.enable {
    home.packages = [ pkgs.claude-code ];

    # Agent teams sit behind this experimental flag. settings.json would take it
    # too, but /config rewrites that file at runtime, so keep it out of Nix.
    home.sessionVariables.CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS = "1";
  };
}
