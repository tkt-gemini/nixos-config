# ./flake.nix

{
  description = "HP ZBook G11 - AI/DS Minimal NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NOTE: Add packages the release latest, ex:
    # quickshell = {
    #   url = "github:quickshell-mirror/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # }
  };

  # WARN: There may be multiple hosts.
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      # NOTE: File variables.nix return attribute set { username = "..."; ... }.
      vars = import ./hosts/hp_zbook_g11/variables.nix;
      system = vars.system;     
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        hp_zbook_g11 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs-unstable vars; };
          modules = [
            ./hosts/hp_zbook_g11/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable vars; };
              home-manager.users.${vars.username} = import ./home/default.nix;
            }
          ];
        };
      };
    };
}

