{ config, pkgs, ...}: {
	programs.kitty = {
		enable = true;
		font = {
			#name = "Iosevka Term";
			name = "cozette";
			size = 12;
			#name = "eldur";
			#size = 9.75;
		};
		settings = {
			cursor_blink_interval = 0;
			window_margin_width = 10;
		};
		themeFile = "Catppuccin-Mocha";
	};
}
