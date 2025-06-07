{ config, pkgs, inputs, ... }: {
	imports = [ ./hardware.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	# networking.wireless.enable = true;	# wpa_supplicant.
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Lisbon";
	i18n.defaultLocale = "en_US.UTF-8";

	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;
	programs.hyprland.enable = true;
	programs.sway.enable = true;

	services.xserver.xkb = {
		layout = "us";
		variant = "altgr-intl";
	};

	services.libinput.enable = true;

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	services.bitlbee = {
		enable = true;
		libpurple_plugins = with pkgs; [ purple-discord ];
	};

	services.avahi.enable = true;
	services.avahi.nssmdns = true;

	users.users.anon = {
		isNormalUser = true;
		description = "Anonymous";
		initialPassword = "244466666";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		packages = with pkgs; [];
	};

	programs.zsh.enable = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		neovim
		git
		man-pages
		man-pages-posix
	];

	documentation.dev.enable = true;

	fonts.enableDefaultPackages = true;

	environment.variables.EDITOR = "nvim";
	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "24.11";
}
