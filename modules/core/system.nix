{ vars, ... }:
{
  time.timeZone = vars.timeZone;
  i18n.defaultLocale = vars.defaultLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN.UTF-8";
    LC_IDENTIFICATION = "vi_VN.UTF-8";
    LC_MEASUREMENT = "vi_VN.UTF-8";
    LC_MONETARY = "vi_VN.UTF-8";
    LC_NAME = "vi_VN.UTF-8";
    LC_NUMERIC = "vi_VN.UTF-8";
    LC_PAPER = "vi_VN.UTF-8";
    LC_TELEPHONE = "vi_VN.UTF-8";
    LC_TIME = "vi_VN.UTF-8";
  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  programs.dconf.enable = true;
}
