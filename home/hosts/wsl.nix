{ ... }:

{
  imports = [ ../common.nix ];

  home = {
    username = "iteramichi";
    homeDirectory = "/home/iteramichi";
    stateVersion = "24.11";
  };

  dotfiles.enable = [
    "claude-code"
    "codex"
    "direnv"
    "gh"
    "git"
    "herdr"
    "zsh"
  ];
}
