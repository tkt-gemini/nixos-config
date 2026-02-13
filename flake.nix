# ./flake.nix

{
  description = "NixOS Configuration - multiple hosts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    /*
    NOTE: Add packages the release latest, ex:
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    }
    */
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      hostNames = nixpkgs.lib.attrNames (
        nixpkgs.lib.filterAttrs
          (name: type: type == "directory" && builtins.pathExists ./hosts/${name}/hardware.nix)
          (builtins.readDir ./hosts)
      );

      mkSystem = hostName:
        let
          # NOTE: variables -> AttrSet { username = "..."; ... }
          vars = import ./hosts/${hostName}/variables.nix;
          system = vars.system or "x86_64-linux";
          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit self inputs vars unstable; };
          modules = [
            ./hosts/${hostName}
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit self inputs vars unstable; };
              home-manager.users.${vars.username} = import ./home; 
            }
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostNames mkSystem;
    };
}

