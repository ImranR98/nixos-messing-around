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

  services.flatpak.enable = true;
}
