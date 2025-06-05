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
		};
		extraConfig = ''
addhl global/trl show-whitespaces -only-trailing -tab '»' -spc '·' -lf ' '
addhl global/lcs show-whitespaces -tab '»' -spc ' ' -lf ' '
'';
	};
}
