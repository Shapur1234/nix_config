{
  environment.persistence."/nix/persist" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];

    users.jirka = {
      directories = [
        "Documents"
        "src"
        "script"
        "nix_config"

        ".librewolf"
        ".mozilla"
        ".thunderbird"
        ".config/chromium"

        ".cargo"
      ];
      files = [ ];
    };
  };
}
