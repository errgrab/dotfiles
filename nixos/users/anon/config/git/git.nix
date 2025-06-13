{ config, pkgs, ... }: {
	programs.git = {
		enable = true;
		userName = "ErikG";
		userEmail = "eriklustosa@gmail.com";
	};
}
