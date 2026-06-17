# Installation
---
## Imperative
nix profile install github:Refearal/hiddify-nix
## Declarative with flakes
''' nix
inputs = {
  hiddify.url = "github:Refearal/hiddify-nix";

  #optional
  hiddify.inputs.nixpkgs.follows = "nixpkgs";
}
'''
