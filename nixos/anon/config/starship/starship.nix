{ config, pkgs, ... }: {
	programs.starship = {
		enable = true;
		settings = {
			directory.disabled = true;

			custom.success_dir = {
				when = "test $? -eq 0";
				shell = "zsh";
				command = "print -P \"%1~\"";
				format = "[$output](bold green)";
				style = "";
			};

			custom.error_dir = {
				when = "test $? -ne 0";
				shell = "zsh";
				command = "print -P \"%1~\"";
				format = "[$output](bold red)";
				style = "";
			};
		};
	};
}
