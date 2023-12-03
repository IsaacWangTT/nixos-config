deploy:
	sudo nixos-rebuild switch --flake .#mikasa

test:
	sudo nixos-rebuild test --flake .#mikasa

debug:
	sudo nixos-rebuild test --flake .#mikasa --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 2d
	sudo nix store gc --debug

fmt:
	nix fmt
