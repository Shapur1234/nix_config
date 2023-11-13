{ pkgs, ... }:
{

  users.mutableUsers = false;
  users.users.jirka = {
    initialHashedPassword = "$6$9S9qnOWcrUwILNTR$ZVWu7N7vDkAlmz2IddjE1QnTTNk5H65sLfoOX5qlSlNlwJ228Xvc3uNKg051RxbwWUs/IDVnKDIe8YaWuQ4u9/";

    isNormalUser = true;
    description = "Jirka";
    extraGroups = [ "networkmanager" "wheel" ];

    shell = pkgs.fish;
  };
  users.users.root.initialHashedPassword = "$6$reH9IwLj/XNSABgw$f0wjnwqB36D96L2LgAqAyotQrqquc3LvO2T3LEKG.YAXHjSrPgO/In3NmcK0qv1teAzjiRgw6qC8igx50qHLu.";
}
