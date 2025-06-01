{ config, pkgs, ... }: {
	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			line_break.disabled = true;
			directory.truncation_length = 1;
			status = {
				disabled = false;
				format = "[\\[$status\\]]($style)";
			};
			character = {
				disabled = true;
				success_symbol = "[➜](bold green)";
				error_symbol = "[➜](bold red)";
			};
		};
	};
}
