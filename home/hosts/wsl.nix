{ ... }:

{
  imports = [ ../common.nix ];

  home = {
    username = "iteramichi";
    homeDirectory = "/home/iteramichi";
    stateVersion = "24.11";
  };

  dotfiles.enable = [
    "awscli"
    "claude-code"
    "codex"
    "direnv"
    "docker-sbx"
    "gh"
    "ghq"
    "git"
    "herdr"
    "starship"
    "zsh"
  ];
}
