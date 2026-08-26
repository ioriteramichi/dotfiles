username := "iteramichi"
host := "wsl"
config := username + "@" + host

default:
    @just --list

build:
    nh home build . -c {{config}}

switch:
    nh home switch . -c {{config}}

update:
    nix flake update

gc:
    nix-collect-garbage -d

check:
    nix flake check

fmt:
    nix fmt $(git ls-files -- '*.nix')

lint:
    deadnix .
    statix check .

fix:
    deadnix -e .
    statix fix .
    nix fmt $(git ls-files -- '*.nix')
