{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];
          buildInputs = with pkgs; [
            R
            rPackages.pagedown
            rPackages.tidyverse
            rPackages.arrow
            rPackages.babynames
            rPackages.curl
            rPackages.duckdb
            rPackages.gapminder
            rPackages.ggrepel
            rPackages.ggridges
            rPackages.ggthemes
            rPackages.hexbin
            rPackages.janitor
            rPackages.Lahman
            rPackages.palmerpenguins
            rPackages.openxlsx
            rPackages.nycflights13
            rPackages.maps
            rPackages.leaflet
            rPackages.repurrrsive
            rPackages.tidymodels
            rPackages.writexl
            chromium
            pandoc
            texlive.combined.scheme-full
            rstudio
          ];
        };
      }
    );
}
