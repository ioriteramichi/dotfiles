{ config, lib, ... }:

{
  options.dotfiles.programs.zsh.enable = lib.mkEnableOption "Zsh";

  config = lib.mkIf config.dotfiles.programs.zsh.enable {
    programs.zsh.enable = true;

    # home-manager can't touch /etc/passwd or /etc/shells itself, so set the
    # login shell as an activation step instead: switch runs this, prompting
    # for sudo only when the login shell isn't already the nix-profile zsh.
    home.activation.setDefaultShell =
      let
        zshPath = "$HOME/.nix-profile/bin/zsh";
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        currentShell=$(grep "^$USER:" /etc/passwd | cut -d: -f7)
        if [ "$currentShell" != "${zshPath}" ]; then
          if ! grep -qxF "${zshPath}" /etc/shells 2>/dev/null; then
            echo "${zshPath}" | /usr/bin/sudo tee -a /etc/shells >/dev/null
          fi
          /usr/bin/sudo chsh -s "${zshPath}" "$USER"
        fi
      '';
  };
}
