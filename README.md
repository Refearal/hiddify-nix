# Installation
---
## Imperative
nix profile install github:Refearal/hiddify-nix
## Declarative with flakes
flake.nix
```nix
inputs = {
  hiddify.url = "github:Refearal/hiddify-nix";

  #optional
  hiddify.inputs.nixpkgs.follows = "nixpkgs";
}
```
configuration.nix
```nix
environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
];
```
## Declarative without flakes
```nix
environment.systemPackages = [
    (
      import (builtins.fetchTarball https://github.com/Refearal/hiddify-nix/archive/main.tar.gz) { inherit pkgs; }
    )
];
```
