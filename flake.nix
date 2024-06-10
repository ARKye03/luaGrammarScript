{
  description = "Simple lua flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          shell = pkgs.mkShell {
            nativeBuildInputs = with pkgs.buildPackages; [
              lua
              nil
              luaPackages.luasocket
              luaPackages.luasec
              luaPackages.cjson
              nixpkgs-fmt
            ];
          };
        in
        {
          devShells.default = shell;
        }
      );
}
