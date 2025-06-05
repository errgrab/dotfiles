{ config, pkgs, ... }: {
	programs.kakoune = {
		enable = true;
		colorSchemePackage = pkgs.kakounePlugins.kakoune-catppuccin;
		config = {
			indentWidth = 0;
			tabStop = 4;
			colorScheme = "catppuccin_mocha";
			numberLines = {
				enable = true;
				relative = true;
			};
			showWhitespace = {
				enable = true;
				tab = "»";
				lineFeed = " ";
			};
		};
		extraConfig = "addhl global/lcs show-whitespaces -only-trailing -spc '·' -lf ' '";
	};
}
