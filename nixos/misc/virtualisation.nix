{

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "jirka" ];

  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;

  # users.users.jirka.extraGroups = [ "libvirtd" ];
}
