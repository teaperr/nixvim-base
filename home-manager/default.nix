{ config, pkgs, ...}:

{
  imports = [
    ./zsh.nix
    ./nvim
  ];
}
