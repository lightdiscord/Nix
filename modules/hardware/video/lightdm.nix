{ config, lib, pkgs, ... }:

with lib;

let
	cfg = config.lambda.hardware.video.lightdm;
in {
	options.lambda.hardware.video.lightdm = {
		enable = mkEnableOption "LightDM";

		background = mkOption {
			type = types.nullOr types.str;
			description = ''
				Path to the lightdm background.
			'';
		};
	};

	config = mkIf cfg.enable {
		services.xserver = {
			displayManager.lightdm = {
				enable = true;
				inherit (cfg) background;
			};
		};
	};
}