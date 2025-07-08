{
  lib,
  pkgs,
  config,
  ...
}: {
  ### Video drivers para Xorg y Wayland ###
  services.xserver = {
    enable = true;
    videoDrivers = ["intel"]; # usa el driver modesetting/intel
    libinput.enable = true;
  };

  ### Módulos del kernel ###
  boot = {
    kernelModules = ["i915"]; # driver Intel
    kernelParams = [
      "i915.enable_rc6=7" # ahorro de energía
      "i915.enable_psr=1" # Panel Self Refresh
      "i915.enable_fbc=1" # Framebuffer compression
    ];
  };

  ### OpenGL y VA-API / Vulkan ###
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa;
    extraPackages = with pkgs; [
      intel-media-driver # VA‑API moderno ("iHD")
      libva-utils # herramientas VA‑API
      vulkan-tools # vulkaninfo, etc.
      vulkan-intel # driver Vulkan para Intel
    ];
  };

  ### Variables de entorno para Wayland / VA-API ###
  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD"; # driver VA‑API Intel moderno
    XDG_SESSION_TYPE = "wayland"; # forzar Wayland
    GBM_BACKEND = "drm"; # backend GBM
    WLR_NO_HARDWARE_CURSORS = "1"; # arregla cursores rotos a veces
    MOZ_ENABLE_WAYLAND = "1"; # Firefox en Wayland
  };

  ### Configuración de nixpkgs ###
  nixpkgs.config = {
    allowUnfree = false; # no necesitas nada privativo
  };

  ### Paquetes útiles ###
  environment.systemPackages = with pkgs; [
    glxinfo # para verificar OpenGL
    vainfo # para verificar VA‑API
    vulkan-tools # para vulkaninfo
  ];
}
