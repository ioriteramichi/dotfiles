{ config, lib, ... }:

{
  options.dotfiles.programs.starship.enable = lib.mkEnableOption "Starship prompt";

  config = lib.mkIf config.dotfiles.programs.starship.enable {
    programs.starship = {
      enable = true;

      settings = {
        # The default branch symbol is U+E0A0, which only Nerd Fonts provide and
        # renders as tofu in the VSCode terminal's default font. Drop it and let
        # the "on <branch>" wording carry the meaning instead.
        git_branch.symbol = "";
      };
    };
  };
}
