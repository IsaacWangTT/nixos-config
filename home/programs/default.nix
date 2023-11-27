let
  directoryContents = builtins.readDir ./.;
  directories = builtins.filter
    (name: directoryContents."${name}" == "directory")
    (builtins.attrNames directoryContents);
  imports = map (name: ./. + "/${name}") directories;
in
{
  imports = imports;
}
