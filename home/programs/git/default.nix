{ config, lib, ... }:

{
  options.dotfiles.programs.git.enable = lib.mkEnableOption "Git";

  config = lib.mkIf config.dotfiles.programs.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "ioriteramichi";
          email = "169627251+ioriteramichi@users.noreply.github.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
