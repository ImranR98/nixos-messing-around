{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, flatpaks, flake-utils, ... }: {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        /etc/nixos/configuration.nix
        flatpaks.nixosModules.declarative-flatpak
        ./pc.nix
        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.imranr = ./home.nix;
          };
        }
      ];
    };
  };
}