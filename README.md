# nixapt
Simple Wrapper to Nix for Apt-style Commands on non-NixOS Systems

## Requirements
- `fish` OR `nu`
- `nix`

## Usage
`$ nixapt install fish htop`  
to install packages  

`$ nixapt remove htop`  
to remove packages  

`$ nixapt update; and nixapt upgrade`  
to update channels and upgrade packages  

`$ nixapt list`  
to list installed packages

`$ nixapt search zsh`  
to search for available packages
