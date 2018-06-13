{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    opensc
    gnupg
    pcsctools
    yubikey-personalization
  ];

  services.pcscd.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  programs.ssh.startAgent = false;
}