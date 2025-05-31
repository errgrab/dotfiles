{ config, pkgs, ... }: {
	home.username = "anon";
	home.homeDirectory = "/home/anon";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		bemenu
		brightnessctl
		btop
		clang
		cozette
		emacs
		equibop
		fzf
		gnumake
		helix
		iosevka
		kitty
		lldb
		llvm
		neofetch
		nerd-fonts.iosevka
		nerd-fonts.monoid
		ripgrep
		tree
		tmux
		vscode
		waybar
		zed-editor
	];

	imports = [
		./config/waybar/waybar.nix
		./config/kitty/kitty.nix
		./config/tmux/tmux.nix
		./config/nvim/nvim.nix
	];

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

	# When program.nix isn't enought
	home.file = {
		".config" = {
			source = ./config/.config;
			recursive = true;
		};
	};

	programs.home-manager.enable = true;
	nixpkgs.config.allowUnfree = true;
}
