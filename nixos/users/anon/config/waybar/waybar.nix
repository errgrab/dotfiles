{ config, pkgs, ... }: {
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "hyprland/workspaces" ];
				modules-right = [ 
					"memory" "cpu" "temperature" "network" "pulseaudio" "battery" "tray" "clock" "custom/power"
				];
				"hyprland/workspaces" = {
					on-click = "activate";
					disable-scroll = true;
					format = " {icon} ";
					format-icons = { default = ""; };
					persistent-workspaces = {
						"*" = 5;
					};
				};
				"clock" = {
					timezone = "Europe/Lisbon";
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					format-alt = "{:%d/%m/%Y}";
				};
				"memory" = {
					format = "  {}%";
				};
				"cpu" = {
					format = "  {usage}%";
					tooltip = false;
				};
				"temperature" = {
					critical-threshold = 80;
					format = "{icon} {temperatureC}°C";
					format-icons = ["" "" ""];
				};
				"network" = {
					format-wifi = "󰖩  {essid} ({signalStrength}%)";
					format-ethernet = "  {ipaddr}/{cidr}";
					tooltip-format = "󰖩  {ifname} via {gwaddr}";
					format-linked = "󰤠  {ifname} (No IP)";
					format-disconnected = "󰤭  Disconnected";
					format-alt = "{ifname} = {ipaddr}/{cidr}";
				};
				"pulseaudio" = {
					format = "{icon} {volume} {format_source}";
					format-muted = "  {format_source}";
					format-source = " {volume}";
					format-source-muted = " ";
					format-icons = {
						default = ["" " " " "];
					};
					on-click = "pwvucontrol";
				};
				"battery" = {
					states = {
						warning = 30;
						critical = 15;
					};
					format = "{icon} {capacity}%";
					format-icons = [" " " " " " " " " "];
				};
				"tray" = {
					icon-size = 21;
					spacing = 10;
				};
				"custom/power" = {
					format = "⏻ ";
					tooltip = false;
					on-click = "hyprctl dispatch exit &";
				};
			};
		};
		style = builtins.readFile ./style.css;
	};
}
