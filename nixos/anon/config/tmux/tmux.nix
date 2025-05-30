{ config, pkgs, ... }: {
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		customPaneNavigationAndResize = true;
		disableConfirmationPrompt = true;
		escapeTime = 0;
		extraConfig = builtins.readFile ./tmux.conf;
		keyMode = "vi";
		mouse = true;
		prefix = "`";
		shell = "${pkgs.zsh}/bin/zsh";
		terminal = "screen-256color";
	};
}
