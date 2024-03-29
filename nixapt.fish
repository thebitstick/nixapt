#!/usr/bin/env fish

switch $argv[1]
	case update
		nix-channel --update nixpkgs
	case upgrade full-upgrade
		nix-env --upgrade '*'
	case install
		if test -z $argv[2]
			echo "Package(s) name required"
			exit 1
		else
			nix-env --install --attr nixpkgs.{$argv[2..-1]}
		end
	case remove
		if test -z $argv[2]
			echo "Package(s) name required"
			exit 1
		else
			nix-env --uninstall $argv[2..-1]
		end
	case autoremove
		nix-collect-garbage -d
	case search show
		if test -z $argv[2]
			echo "Package(s) name required"
			exit 1
		else
			if command -q jq
				nix-env -qa --json $argv[2..-1] | jq
			else
				nix-env -qa --json $argv[2..-1]
			end
		end
	case list
		nix-env --query $argv[2..-1] --description
	case '' '--help' '-h'
		echo "OVERVIEW: Simple wrapper for apt-style commands with Nix on macOS"
		echo
		echo "USAGE: nixapt [ update | upgrade | install PACKAGES... | remove PACKAGES... | autoremove | search | list ]"
	case '-v' '--version'
		echo "nixapt 0.0.1"
	case '*'
		echo "Unknown command"
end
