{ pkgs ? import <nixpkgs> {}, config, options, lib, modulesPath }:

let kdf-www-packages = import ./default.nix { inherit pkgs; };
in
{
  services.nginx.enable = true;
  services.nginx.virtualHosts = {
    "localhost" = kdf-www-packages.nginx-locations;
  };
}
