{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.mollan = ./home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                inputs.niri.homeModules.niri
                inputs.spicetify-nix.homeManagerModules.default
                inputs.nixvim.homeModules.default
                inputs.dms.homeModules.dank-material-shell
                inputs.dms.homeModules.niri
              ];
            };

            environment.systemPackages = [
              inputs.zen-browser.packages.${system}.default
            ];
          }
        ];
      };
    };
}
