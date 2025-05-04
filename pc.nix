{ config, pkgs, lib, ... }:

{
  networking.hostName = lib.mkForce "pc";

  users.users.imranr.extraGroups = lib.mkAfter [ "docker" ];

  programs.firefox.enable = lib.mkForce false;

  environment.systemPackages = with pkgs; [
    git curl wget inotify-tools libheif ffmpeg restic syncthing ffmpeg chromium
    scrcpy perl perlPackages.ImageExifTool openssl
    vscodium android-studio flutter
    veracrypt mullvad-vpn
    distrobox
  ];

  services.udev.extraRules = ''
    # Arduino
    KERNEL=="ttyUSB[0-9]*", MODE="0666"
    KERNEL=="ttyACM[0-9]*", MODE="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0070", MODE="0666"
  '';

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/io.gitlab.librewolf-community//stable"
      "flathub:app/org.videolan.VLC//stable"
      "flathub:app/com.github.tchx84.Flatseal//stable"
      "flathub:app/com.mattjakeman.ExtensionManager//stable"
      "flathub:app/org.qbittorrent.qBittorrent//stable"
      "flathub:app/org.localsend.localsend_app//stable"
      "flathub:app/md.obsidian.Obsidian//stable"
      "flathub:app/cc.arduino.IDE2//stable"
      "flathub:app/com.stremio.Stremio//stable"
      "flathub:app/com.rustdesk.RustDesk//stable"
      "flathub:app/org.cryptomator.Cryptomator//stable"
      "flathub:app/rest.insomnia.Insomnia//stable"
      "flathub:app/org.gimp.GIMP//stable"
      "flathub:app/io.github.glaumar.QRookie//stable"
    ];
  };
}
