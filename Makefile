deploy:
	nixos-rebuild switch --flake .#mikasa --use-remote-sudo

boot:
	nixos-rebuild boot --flake .#mikasa --use-remote-sudo

test:
	nixos-rebuild test --flake .#mikasa --use-remote-sudo

debug:
	nixos-rebuild test --flake .#mikasa --use-remote-sudo --show-trace --verbose

update:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 2d
	sudo nix store gc --debug

fmt:
	nix fmt
