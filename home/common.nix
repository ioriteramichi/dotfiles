{ ... }:

{
  imports = [ ./default.nix ];

  nixpkgs.config.allowUnfree = true;
}
