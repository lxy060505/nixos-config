{
  description = "Lewis' NixOS Configuration";

  # Inputs
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  #Outputs
  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }:
      let
        system = "x86_64-linux";

	mkHost = hostName: nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = {
	    inherit inputs self hostName;
	  };

	  modules = [
            ./hosts/${hostName}

            home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
		extraSpecialArgs = {
                  inherit inputs self hostName;
		};
                users.lewis = ./home/lewis.nix;
              };
            }
	  ];
	};
    
      in
        {
          nixosConfigurations = {
	    nixos-x = mkHost "nixos-x";
	    nixos-vm = mkHost "nixos-vm";
          };
        };
}
