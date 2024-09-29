set -e 
. /home/lotus/.nix-profile/etc/profile.d/nix.sh
# nix build .#homeConfigurations.lotus.activationPackage
nix run home-manager/master -- switch --flake .
