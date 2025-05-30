{ config, pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraConfig = builtins.readFile ./init.vim;
		plugins = with pkgs.vimPlugins; [
			catppuccin-vim
		];
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
	};
}
