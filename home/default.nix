{ config, lib, ... }:

let
  programDirs = builtins.attrNames (
    lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./programs)
  );
in
{
  imports = map (name: ./programs/${name}) programDirs;

  options.dotfiles.enable = lib.mkOption {
    type = lib.types.listOf (lib.types.enum (programDirs ++ [ "*" ]));
    default = [ ];
    description = ''
      Set of dotfiles programs (home/programs/<name>) to enable.
      Use "*" to enable every program instead of listing them one by one.
    '';
  };

  config = {
    dotfiles.programs =
      lib.genAttrs
        (if builtins.elem "*" config.dotfiles.enable then programDirs else config.dotfiles.enable)
        (_: {
          enable = true;
        });

    programs.home-manager.enable = true;
  };
}
