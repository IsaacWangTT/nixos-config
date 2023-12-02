{ config, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
      modesetting.enable = true;
      powerManagement.enable = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:0:1:0";
      };
    };
    opengl.extraPackages = [ pkgs.nvidia-vaapi-driver ];
  };

  environment.systemPackages = [ nvidia-offload ];

  virtualisation.docker.enableNvidia = true;
}
