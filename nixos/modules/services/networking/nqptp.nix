{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.nqptp;
in

{
  options = {
    services.nqptp = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Enable the nqptp services needed for shairport-sync
        '';
      };

      openFirewall = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Whether to automatically open ports in the firewall.
        '';
      };

      user = lib.mkOption {
        type = lib.types.str;
        default = "nqptp";
        description = ''
          User account name under which to run shairport-sync. The account
          will be created.
        '';
      };

      group = lib.mkOption {
        type = lib.types.str;
        default = "nqptp";
        description = ''
          Group account name under which to run shairport-sync. The account
          will be created.
        '';
      };
    };
  };

  config = lib.mkIf config.services.nqptp.enable {
    users = {
      users.${cfg.user} = {
        description = "Nqptp user";
        isSystemUser = true;
        group = cfg.group;
      };
      groups.${cfg.group} = {};
    };

    networking.firewall = lib.mkIf cfg.openFirewall {
      allowedUDPPortRanges = [
        319
        320
      ];
    };

    systemd = {
      systemd.packages = pkgs.nqptp;
      services.nqptp = {
        serviceConfig = {
          User = cfg.user;
          Group = cfg.group;
        };
      };
    };
  };
}
