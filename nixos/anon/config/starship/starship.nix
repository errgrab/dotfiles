{ config, pkgs, ... }: {
	programs.starship = {
		enable = true;
		settings = {
			format = "$status$all";
			add_newline = false;
			line_break.disabled = true;
			character.disabled = true;
			directory.truncation_length = 1;
			status = {
				disabled = false;
				format = "[\\[$status\\]]($style) ";
			};
		};
	};
}
