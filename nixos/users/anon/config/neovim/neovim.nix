{ config, pkgs, ... }: {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraConfig = builtins.readFile ./init.vim;
		plugins = with pkgs.vimPlugins; [
			catppuccin-nvim
			copilot-vim
		];
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
	};
}
