{ config, pkgs, ... }:
{
  programs.neovim.enable = true;
  programs.waybar.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = "gtk";
  };
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];
  services.dbus.enable = true;
  programs.mango.enable = true;
  programs.nix-ld.enable = true;
  programs.java.enable = true;
  programs.java.package = pkgs.jdk17_headless;
  programs.fish.enable = true;
}







