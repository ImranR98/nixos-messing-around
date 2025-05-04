{
  config,
  pkgs,
  lib,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = lib.mkForce "pc";

  users.users.imranr.extraGroups = lib.mkAfter [
    "docker"
    "kvm"
    "adbusers"
    "user-with-access-to-virtualbox"
  ];

  programs.adb.enable = true;

  programs.firefox.enable = lib.mkForce false;

  services.syncthing = {
    enable = true;
    # dataDir = "/home/your_username/Sync";
    openDefaultPorts = true;
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    inotify-tools
    libheif
    ffmpeg
    restic
    syncthing
    ffmpeg
    scrcpy
    perl
    perlPackages.ImageExifTool
    openssl
    htop
    nodejs
    veracrypt
    mullvad-vpn
    distrobox
    nixfmt-rfc-style
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        dart-code.flutter
        dart-code.dart-code
        ms-python.python
        redhat.ansible
        # jeanp413.open-remote-ssh # fails
      ];
    })
    steam
    lutris
    ungoogled-chromium
  ];

  services.udev.extraRules = ''
    # Arduino
    KERNEL=="ttyUSB[0-9]*", MODE="0666"
    KERNEL=="ttyACM[0-9]*", MODE="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", ATTRS{idProduct}=="0070", MODE="0666"
  '';

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;

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
      "flathub:app/org.getmonero.Monero//stable"
      "flathub:app/io.github.glaumar.QRookie//stable"
      "flathub:app/org.libreoffice.LibreOffice//stable"
    ];
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.gnome-maps
    pkgs.firefox
    pkgs.rhythmbox
    pkgs.totem
    pkgs.yelp
    pkgs.gnome-music
  ];

  nixpkgs.config.allowUnfree = true;

  services.udev.packages = [ pkgs.android-udev-rules ];
}
