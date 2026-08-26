{ ... }:

{
  imports = [ ../common.nix ];

  home = {
    username = "iteramichi";
    homeDirectory = "/home/iteramichi";
    stateVersion = "24.11";
  };

  dotfiles.enable = [
    "direnv"
    "gh"
    "git"
    "herdr"
    "zsh"
  ];
}
