{ config, pkgs, ... }:
{
	programs.tmux = {
		enable = true;
		prefix = "`";
		baseIndex = 1;
		customPaneNavigationAndResize = true;
		keyMode = "vi";
		mouse = true;
		escapeTime = 1000;
		extraConfig = builtins.readFile ./extra.conf;
	};
}
