{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./applications/packages.nix
      ./applications/programs.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  networking.hostName = "ognjen";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Belgrade";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  users.users.ognjen = {
    isNormalUser = true;
    description = "ognjen";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  services.getty.autologinUser = "ognjen";
  nixpkgs.config.allowUnfree = true;
  systemd.user.services."xdg-desktop-portal-gtk".enable = false;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.stateVersion = "25.05";
}
