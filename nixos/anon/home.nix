{ config, pkgs, ... }:
{
	home.username = "anon";
	home.homeDirectory = "/home/anon";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		btop
		clang
		emacs
		fzf
		gnumake
		helix
		kitty
		lldb
		llvm
		neofetch
		ripgrep
		tree
		vscode
		waybar
		wofi
		zed-editor
	];

	home.file = {
		".config" = {
			source = ./dotfiles/.config;
			recursive = true;
		};
	};

	programs.git = {
		enable = true;
		userName = "ErikG";
		userEmail = "eriklustosa@gmail.com";
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			line_break.disabled = true;
			directory.truncation_length = 1;
		};
	};

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
			plugins = [];
			theme = "";
		};
	};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;

	nixpkgs.config.allowUnfree = true;
}
