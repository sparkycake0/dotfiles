{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/2935ac1c-8d38-4f50-a02f-6db8593c09bb";
      fsType = "ext4";
    };
  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/C5C3-5D1E";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  swapDevices =
    [{ device = "/dev/disk/by-uuid/ceb3339b-9189-43c3-ad7f-81fc047c8311"; }];
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
