{
  description = "Python dev env";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs}:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShell.x86_64-linux = pkgs.mkShell {
        shellHook = ''
	  virtualenv -p python3 .venv
	  source .venv/bin/activate
	'';
	buildInputs = with pkgs; [
	  python3
	  python311Packages.pip
	  python311Packages.virtualenv
	  jq
	];
      };
    };
}
