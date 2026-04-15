{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      inputs = self.inputs;
    in
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.default
          inputs.niri.nixosModules.niri
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.mollan = ./home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                inputs.spicetify-nix.homeManagerModules.default
                inputs.nixvim.homeModules.default
              ];
            };

            environment.systemPackages = [
            ];
          }
        ];
      };
    };
}
