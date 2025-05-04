{ config, pkgs, ... }:

{
  # home.activation = {
  #   addFlathub = hm.dag.entryAfter ["writeBoundary"] ''
  #     ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists \
  #       flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #   '';

  #   installFlatpaks = hm.dag.entryAfter ["addFlathub"] ''
  #     ${pkgs.flatpak}/bin/flatpak install --user -y flathub \
  #       io.gitlab.librewolf-community \
  #       org.videolan.VLC \
  #       com.github.tchx84.Flatseal \
  #       com.mattjakeman.ExtensionManager \
  #       org.qbittorrent.qBittorrent \
  #       org.localsend.localsend_app \
  #       md.obsidian.Obsidian \
  #       cc.arduino.IDE2 \
  #       com.stremio.Stremio \
  #       com.rustdesk.RustDesk \
  #       org.cryptomator.Cryptomator \
  #       rest.insomnia.Insomnia \
  #       org.gimp.GIMP \
  #       io.github.glaumar.QRookie
  #   '';

  #   fixStremio = hm.dag.entryAfter ["installFlatpaks"] ''
  #     ${pkgs.flatpak}/bin/flatpak override --user \
  #       --filesystem=!host com.stremio.Stremio
  #     ${pkgs.flatpak}/bin/flatpak override --user \
  #       --env=LD_PRELOAD= com.stremio.Stremio
  #   '';
  # };

  # GNOME configuration
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "caffeine@patapon.info"
        "clipboard-indicator@tudmotu.com" 
        "gsconnect@andyholmes.github.io"
        "nightthemeswitcher@romainvigier.fr"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
      
      "custom-keybindings/custom0/name" = "Files";
      "custom-keybindings/custom0/command" = "nautilus -w";
      "custom-keybindings/custom0/binding" = "<Super>e";

      "custom-keybindings/custom1/name" = "Terminal";
      "custom-keybindings/custom1/command" = "kgx";
      "custom-keybindings/custom1/binding" = "<Super>t";

      "custom-keybindings/custom2/name" = "Codium";
      "custom-keybindings/custom2/command" = "codium -n";
      "custom-keybindings/custom2/binding" = "<Super>c";
    };
  };

  # Systemd services
  # systemd.user.services.etesync-dav = {
  #   Unit.Description = "EteSync DAV Server";
  #   Service = {
  #     ExecStart = "${pkgs.etesync-dav}/bin/etesync-dav";
  #     Restart = "always";
  #   };
  #   Install.WantedBy = [ "default.target" ];
  # };

  home.stateVersion = "24.11";
}