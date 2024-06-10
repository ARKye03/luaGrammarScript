{
  description = "Simple lua flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lua_packages = with pkgs.luaPackages; [
            luasocket
            luasec
            cjson
          ];
          shell = pkgs.mkShell {
            nativeBuildInputs = with pkgs.buildPackages; [
              lua
              nil
              nixpkgs-fmt
            ] ++ lua_packages;
          };
        in
        {
          devShells.default = shell;
        }
      );
}
