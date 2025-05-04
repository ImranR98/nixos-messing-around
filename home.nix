{ config, pkgs, ... }:

{
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

  home.stateVersion = "24.11";
}