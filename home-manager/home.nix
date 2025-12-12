{ config, pkgs, lib, ... }:

{
  home.username = "ognjen";
  home.homeDirectory = "/home/ognjen";
  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = [ pkgs.vimix-cursors ];

  home.pointerCursor = {
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
    size = 16;
    gtk.enable = true;
  };
}





