{
  environment.persistence."/nix/persist" = {
    hideMounts = true;

    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/log"
      "/var/lib"
    ];
    files = [
      "/etc/machine-id"
    ];

    users.jirka = {
      directories = [
        "Documents"
        "Music"
        "Pictures"
        "Programming"
        "Videos"
        "nix_config"

        ".librewolf"
        ".mozilla"
      ];
      files = [ ];
    };
  };
}
