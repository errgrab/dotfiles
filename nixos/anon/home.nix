{ config, pkgs, ... }: {
	home.username = "anon";
	home.homeDirectory = "/home/anon";

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		bemenu
		brave
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
		tmux
		tree
		vscode
		waybar
		zed-editor
	];

	imports = [
		./config/waybar/waybar.nix
		./config/kitty/kitty.nix
		./config/tmux/tmux.nix
		./config/nvim/nvim.nix
		./config/helix/helix.nix
		./config/zsh/zsh.nix
		./config/starship/starship.nix
	];

	programs.git = {
		enable = true;
		userName = "ErikG";
		userEmail = "eriklustosa@gmail.com";
	};

/*	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			line_break.disabled = true;
			directory.truncation_length = 1;
		};
	};*/

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
