{ config, pkgs, ... }: {
	home.file = {
		".config" = {
			source = ./config;
			recursive = true;
		};
	};
}
