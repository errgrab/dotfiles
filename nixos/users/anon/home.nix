{ config, pkgs, ... }: {
	home.username = "anon";
	home.homeDirectory = "/home/anon";

	home.stateVersion = "25.05";

	imports = [
		./config/pkgs/pkgs.nix
		./config/waybar/waybar.nix
		./config/kitty/kitty.nix
		./config/tmux/tmux.nix
		./config/neovim/neovim.nix
		./config/helix/helix.nix
		./config/zsh/zsh.nix
		./config/starship/starship.nix
		./config/git/git.nix
		./config/kakoune/kakoune.nix
		./config/files/files.nix
	];

	programs.home-manager.enable = true;
}
