{ pkgs ? import <nixpkgs> {}}:

with pkgs;

let kdf-www = stdenv.mkDerivation {
  name = "kdf-www";
  src = ./.;

  installPhase = ''
    mkdir -p $out
    cp index.html $out
  '';
};
in
rec {
  nginx-locations = {
    locations."/" = {
      root = kdf-www;
    };
  };
}
