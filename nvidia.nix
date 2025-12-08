{ ... }:

{
    # For offloading, `modesetting` is needed additionally,
  # otherwise the X-server will be running permanently on nvidia,
  # thus keeping the GPU always on (see `nvidia-smi`).
  services.xserver.videoDrivers = [
    "modesetting"  # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    "nvidia"
  ];

  hardware.nvidia.open = true;  # see the note above
  hardware.nvidia.prime = {

    offload.enable = true;
    offload.enableOffloadCmd = true;
  
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    #amdgpuBusId = "PCI:54:0:0"; # If you have an AMD iGPU
  };  
}
