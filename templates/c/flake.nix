{
  description = "C/C++ development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default =
        pkgs.mkShell.override
          {
            # stdenv = pkgs.gcc14Stdenv;
            stdenv = pkgs.clangStdenv;
          }
          {
            packages = with pkgs; [
              clang-tools
              gnumake
              cmake
              ninja
              gdb
              valgrind
              pkg-config
              man-pages
              man-pages-posix
              bear
            ];

            shellHook = ''
              export CLANGD_FLAGS="--query-driver=$(which $CC):$(which $CXX)"
              echo "C development environment ready (GCC $($CC --version | head -1))"
            '';
          };
    };
}
