# Hyprpaper is used to set the wallpaper on the system
{lib, ...}: {
  # The wallpaper is set by stylix
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = ["/home/blynd/Pictures/wallpapers/forest.png"];
      wallpaper = [
        "eDP-1,/home/blynd/Pictures/wallpapers/forest.png"
      ];
    };
  };
  systemd.user.services.hyprpaper.Unit.After =
    lib.mkForce "graphical-session.target";
}
