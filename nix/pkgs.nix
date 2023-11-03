inputs: system:
let
  pluginOverlay = final: prev:
  let
    inherit (prev.vimUtils) buildVimPlugin;

    plugin = filter: builtins.filter
      (s: (builtins.match "${filter}_.*" s) != null)
      (builtins.attrNames inputs);

    pluginName = filter: input:
      builtins.substring
        (builtins.stringLength "${filter}_")
        (builtins.stringLength input)
        input;

    buildPlugin = filter: name: buildVimPlugin {
      pname = (pluginName filter) name;
      version = "master";
      src = builtins.getAttr name inputs;
    };
  in {
    LoadPlugins = builtins.listToAttrs (map
      (Load: {
        name = (pluginName "Load") Load;
        value = (buildPlugin "Load") Load;
      }) (plugin "Load"));

    LazyPlugins = builtins.listToAttrs (map
      (Lazy: {
        name = (pluginName "Lazy") Lazy;
        value = (buildPlugin "Lazy") Lazy;
      }) (plugin "Lazy"));
  };
in 
import inputs.nixpkgs {
  inherit system;
  overlays = [ pluginOverlay ];
}

