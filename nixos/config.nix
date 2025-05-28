{ config, pkgs, inputs, ... }:
{
	imports = [ ./hardware.nix ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos";
	# networking.wireless.enable = true;	# wpa_supplicant.
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Lisbon";
	i18n.defaultLocale = "en_US.UTF-8";

	services.xserver.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	programs.hyprland.enable = true;

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

	users.users.anon = {
		isNormalUser = true;
		description = "Anonymous";
		initialPassword = "244466666";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		packages = with pkgs; [];
	};


	programs.firefox.enable = true;
	programs.zsh.enable = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		neovim
		git
	];

	fonts.enableDefaultPackages = true;

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		nerd-fonts.zed-mono
	];

	environment.variables.EDITOR = "nvim";
	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "24.11";
}
