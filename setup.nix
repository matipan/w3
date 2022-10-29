let
  getpkgs = import <nixpkgs>;
  pkgs = getpkgs {};
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.curl
      pkgs.git
      pkgs.nodejs-18_x
    ];
    shellHook = ''
      /usr/bin/zsh
    '';
  }  
