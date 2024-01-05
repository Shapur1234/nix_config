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
        "Programming"
        "Scripts"
        "nix_config"

        ".librewolf"
        ".mozilla"
        ".thunderbird"
        ".config/chromium"

        "invokeai"
      ];
      files = [ ];
    };
  };
}
