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
		grim
		helix
		iosevka
		kakoune
		kitty
		lldb
		llvm
		neofetch
		nerd-fonts.iosevka
		nerd-fonts.monoid
		ripgrep
		slurp
		tmux
		tree
		vscode
		waybar
		weechat
		wl-clipboard
	];

	imports = [
		./config/waybar/waybar.nix
		./config/kitty/kitty.nix
		./config/tmux/tmux.nix
		./config/nvim/nvim.nix
		./config/helix/helix.nix
		./config/zsh/zsh.nix
		./config/starship/starship.nix
		./config/git/git.nix
		./config/kakoune/kakoune.nix
	];

	# When the imports isn't enought
	home.file = {
		".config" = {
			source = ./config/.config;
			recursive = true;
		};
	};

	programs.home-manager.enable = true;
}
