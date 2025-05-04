{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.gsconnect
    gnomeExtensions.night-theme-switcher
  ];

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

    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
      gtk-enable-primary-paste = false;
      clock-format = "12h";
      scaling-factor = 1;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
    };

    "org/gnome/shell" = {
      favorite-apps = "[]";
    };

    "org/gnome/Ptyxis" = {
      interface-style = "system";
    };

    "org/gnome/Ptyxis/Shortcuts" = {
      copy-clipboard = "<Control>c";
      paste-clipboard = "<Control>v";
    };

    "org/gnome/desktop/wm/preferences" = {
      audible-bell = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "nothing";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      www = ["<Super>b"];
      email = ["<Super>m"];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "red";
    };
  };

  programs.git = {
    userName = "Imran R";
    userEmail = "contact@imranr.dev";
  };

  home.stateVersion = "24.11";
}
