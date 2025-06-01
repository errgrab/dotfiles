{ config, pkgs, ... }: let
	starshipConfig = pkgs.writeText "starship.toml" ''
[directory]
disabled = true

[custom.colored_dir]
description = "current directory (last segment), colored by exit status"
when = "true"
command = """
bash -lc '
  if [ \"$STARSHIP_EXIT_CODE\" -eq 0 ]; then
	color=green
  else
	color=red
  fi

  dir=\"$PWD\"
  home=\"$(eval echo ~${USER})\"
  if [[ \"$dir\" == \"$home\"* ]]; then
	short=\"~${dir#$home}\"
  else
	short=\"$dir\"
  fi
  short=\"${short##*/}\"

  if [ \"$short\" = \"\" ]; then
	printf \"\e[${color}m~\e[0m\"
  else
	printf \"\e[${color}m%s\e[0m\" \"$short\"
  fi
'
"""

format = """
${custom.colored_dir}
$character
"""
	'';
in {
	programs.starship = {
		enable = true;
		extraConfig = ;
	};
}
