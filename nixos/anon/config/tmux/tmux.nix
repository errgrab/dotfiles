{ config, pkgs, ... }:
{
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		customPaneNavigationAndResize = true;
		disableConfirmationPrompt = true;
		escapeTime = 1000;
		extraConfig = builtins.readFile ./extra.conf;
		historyLimit = 5000;
		keyMode = "vi";
		mouse = true;
		newSession = true;
		prefix = "`";
		shell = "${pkgs.zsh}/bin/zsh";
		terminal = "screen-256color";
	};
}
