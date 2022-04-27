# nixapt
Simple Wrapper to Nix for Apt-style Commands on non-NixOS Systems

## Requirements
- fish
- nix

## Usage
`$ nixapt install fish htop`  
to install packages  

`$ nixapt uninstall htop`  
to remove packages  

`$ nixapt update; and nixapt upgrade`  
to update channels and upgrade packages  

`$ nixapt list`  
to list installed packages