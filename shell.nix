let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/ac218438bdb911f746da1ffcb70c16dddf60dc4f.tar.gz";
    sha256 = "0cbx6ln0ba11fmdhd64kzb62ggis19klbgpb3px04gbmvqx4nl1g";
  })
  {
    overlays = [(self: super: {
      inform6 = self.callPackage ./inform6 {};
    })];
  };

  inform = pkgs.writeShellScriptBin "inform" ''
    ${pkgs.inform6}/bin/inform +include_path=${pkgs.inform6}/lib -v8 "$@"
  '';
in
pkgs.mkShell {
  name = "zescape-env";
  buildInputs = [inform pkgs.frotz];
}
