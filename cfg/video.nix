{ config, lib, pkgs, ... }:

let 
    videoDrivers = [
        "nvidia"
    ];

    xrandrHeads = [
        { output = "HDMI-0"; primary = true; }
        "DVI-I-0"
    ];
in {
    services.xserver = {
        inherit videoDrivers xrandrHeads;
    };

    fonts.fonts = with pkgs; [
        emojione
    ];

    environment.variables.DISPLAY = ":0";
}