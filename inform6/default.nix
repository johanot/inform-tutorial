{ stdenv }:

stdenv.mkDerivation rec{

  name = "inform";
  version = "6.34-6.12.2";

  src = builtins.fetchTarball {
    url = "http://www.ifarchive.org/if-archive/infocom/compilers/inform6/source/${name}-${version}.tar.gz";
    sha256 = "05kd3p84vxi5g1y6ks8clmrb4wq0ybspvklg3wn01f57iggg57sq";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/lib $out/lib
    chmod +w $out/lib
    cp $src/lib/english.h $out/lib/English.h
    cp inform $out/bin/inform
  '';
}
