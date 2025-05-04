{ config, pkgs, ... }:

{  
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        caffeine.extensionUuid
        clipboard-indicator.extensionUuid
        gsconnect.extensionUuid
        night-theme-switcher.extensionUuid
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

  programs.git = {
    userName  = "Imran R";
    userEmail = "contact@imranr.dev";
  };

  home.stateVersion = "24.11";
}