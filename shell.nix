{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/040c6d8374d090f46ab0e99f1f7c27a4529ecffd.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.curl
    pkgs.git
    pkgs.nodejs-18_x
  ];
}
