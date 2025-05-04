#!/usr/bin/env bash

if [ "$1" = 'update' ]; then nix --extra-experimental-features "nix-command flakes" flake update; fi

sudo nixos-rebuild --impure switch --flake .#pc