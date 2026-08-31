{ config, lib, ... }:

{
  options.dotfiles.programs.awscli.enable = lib.mkEnableOption "AWS CLI";

  config = lib.mkIf config.dotfiles.programs.awscli.enable {
    programs.awscli.enable = true;
  };
}
