{
  description = "Isaac Wang's NixOS Configuration";
  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./home/profiles
        ./hosts
        ./modules
      ] ++ [
        inputs.flake-root.flakeModule
        inputs.treefmt-nix.flakeModule
      ];
      perSystem = { config, pkgs, system, ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            inputs.nixGL.overlay
            inputs.nixpkgs-wayland.overlay
          ];
        };

        treefmt.config = {
          inherit (config.flake-root) projectRootFile;
          programs = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            stylua.enable = true;
            yamlfmt.enable = true;
          };
        };

        devShells = {
          default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [ git neovim sbctl ];
            shellHook = "exec fish";
            inputsFrom = [
              config.flake-root.devShell
            ];
          };
          secret = with pkgs; mkShell {
            name = "secret";
            nativeBuildInputs = [ sops age neovim ssh-to-age ];
            shellHook = ''
              exec fish
              export $EDITOR=nvim
            '';
            inputsFrom = [
              config.flake-root.devShell
            ];
          };
        };

        formatter = config.treefmt.build.wrapper;
      };
    };


  inputs = {
    #####  Some flake repositories  #####
    # Software Packages
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"; # Chaotic's Nyx
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Nixpkgs
    nur.url = "github:nix-community/NUR"; # NUR

    # System Tools
    flake-parts.url = "github:hercules-ci/flake-parts"; # Nix Flakes Framework
    flake-root.url = "github:srid/flake-root"; # Find Project Root Directory
    home-manager = {
      url = "github:nix-community/home-manager"; # Home Manager
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote.url = "github:nix-community/lanzaboote"; # Secure Boot
    nixGL.url = "github:nix-community/nixGL"; # OpenGL
    nix-index-database = {
      url = "github:Mic92/nix-index-database"; # Nix-Index-Database
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix"; # Manage Secret
    treefmt-nix.url = "github:numtide/treefmt-nix"; # Format

    # Desktop Environment
    hyprland.url = "github:hyprwm/Hyprland"; # Hyprland
    hypr-contrib.url = "github:hyprwm/contrib"; # contrib
    hypr-hyprpaper.url = "github:hyprwm/hyprpaper"; # hyprpaper
    hypr-hyprpicker.url = "github:hyprwm/hyprpicker"; # hyprpicker
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland"; # Wayland Packages

    # Others
    spicetify-nix.url = "github:the-argus/spicetify-nix"; # spicetify

    #####  Some non-flake repositories  #####
    # NvChad
    nvchad = {
      # Enhance Neovim
      url = "github:NvChad/NvChad";
      flake = false;
    };
    #####  Color Schemes  #####
    catppuccin-btop = {
      url = "github:catppuccin/btop";
      flake = false;
    };
    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
    catppuccin-fcitx5 = {
      url = "github:catppuccin/fcitx5";
      flake = false;
    };
    catppuccin-fish = {
      url = "github:catppuccin/fish";
      flake = false;
    };
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
    catppuccin-kitty = {
      url = "github:catppuccin/kitty";
      flake = false;
    };
    catppuccin-obs = {
      url = "github:catppuccin/obs";
      flake = false;
    };
    catppuccin-rofi = {
      url = "github:catppuccin/rofi/888efaf5634b061c95870dd115efb6e78756d54d";
      flake = false;
    };
    catppuccin-waybar = {
      url = "github:catppuccin/waybar";
      flake = false;
    };
  };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://isaacwangtt.cachix.org"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "isaacwangtt.cachix.org-1:Ib5NW30Vf54PiOBQ3jl1oizqkRCL1gcM4FUJCXwOCQc="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    trusted-users = [ "root" "@wheel" ];
  };
}
