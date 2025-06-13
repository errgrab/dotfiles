{ config, pkgs, ... }: {
	programs.zsh = {
		enable = true;
		shellAliases = {
			ls = "ls --color=auto";
			diff = "diff --color=auto";
			grep = "grep --color=auto";
		};
		initContent = ''
			export PATH="$HOME/.local/bin/:$PATH"
		'';
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "gitfast" "git-prompt" ];
		};
	};
}
