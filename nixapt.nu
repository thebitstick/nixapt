#!/usr/bin/env nu

# Simple wrapper for apt-style commands with Nix on macOS
def main [] {}

# Run channel updates
def "main update" [] {
	nix-channel --update nixpkgs
}

# Run package upgrades
def "main upgrade" [] {
	nix-env --upgrade '*'
}

# Run package upgrades
def "main full-upgrade" [] {
	nix-env --upgrade '*'
}

# Install package(s)
def "main install" [
		...packageName: string		# Package(s) to install
		] { 
	if (($packageName | length) == 0) {
		echo "Package(s) name required"
		exit 1
	} else {
		$packageName | each { |package|
			nix-env --install --attr $"nixpkgs.($package)"
		}
	}
}

# Remove package(s)
def "main remove" [
		...packageName: string		# Package(s) to remove
		] {
	if (($packageName | length) == 0) {
		echo "Package(s) name required"
		exit 1
	} else {
		$packageName | each { |package|
			nix-env --uninstall $package
		}
	}
}

# Remove outdated stores
def "main autoremove" [] {
	nix-collect-garbage -d
}

# Search for packages
def "main search" [
		...packageName: string		# Package(s) to search
		] {
	if (($packageName | length) == 0) {
		echo "Package(s) name required"
		exit 1
	} else {
		$packageName | each { |package|
			nix-env -qa --json $package | from json | get $"nixpkgs.($package)"
		}
	}
}

# Search for packages
def "main show" [
		...packageName: string		# Package(s) to search
		] {
	if (($packageName | length) == 0) {
		echo "Package(s) name required"
		exit 1
	} else {
		$packageName | each { |package|
			nix-env -qa --json $package | from json | get $"nixpkgs.($package)"
		}
	}
}

# List installed packages or specific package
def "main list" [
		packageName?: string		# Package to list
		] {
	if ($packageName == null) {
		nix-env --query --description --json
	} else {
		nix-env --query $packageName --description --json
	}
}
