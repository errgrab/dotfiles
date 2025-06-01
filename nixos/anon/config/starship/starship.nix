{ config, pkgs, ... }: {
	programs.starship = {
		enable = true;
		settings = {
			prompt = "$status $all";
			add_newline = false;
			line_break.disabled = true;
			directory.truncation_length = 1;
			status = {
				disabled = false;
				format = "[\\[$status\\]]($style)";
			};
		};
	};
}
