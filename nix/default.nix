pkgs: { 
  load ? [], 
  lazy ? [], 
  deps ? [],
}:
let
  toLua = str: "lua << EOF\n${str}\nEOF\n";

  myNeovim = pkgs.neovim.override {
    configure = {
      customRC = toLua "require 'config'.init()";
      packages.myVimPackage = {
        start = builtins.attrValues pkgs.LoadPlugins ++ load;
        opt = builtins.attrValues pkgs.LazyPlugins ++ lazy;
      };
    };
  };

  script = pkgs.writeShellScriptBin "nv" ''${myNeovim}/bin/nvim "$@"'';
in pkgs.stdenv.mkDerivation {
  name = "nv";

  src = script;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    ln -s $src/bin/nv $out/bin/nv
    ln -s $out/bin/nv $out/bin/vi
    ln -s $out/bin/nv $out/bin/vim
    ln -s $out/bin/nv $out/bin/nvim
    wrapProgram $out/bin/nv \
      --prefix PATH : ${pkgs.lib.makeBinPath deps}
  '';
}
