{ config, pkgs, ... }: let
	custom-prompt = pkgs.writeText "custom.zsh-theme" ''
		PROMPT=" $(git_prompt_info)%(?.%F{green}.%F{red})%1~%f "

		ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
		ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
		ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
		ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
'';
in {

	programs.zsh = {
		enable = true;
		shellAliases = {
			ls = "ls --color=auto";
			diff = "diff --color=auto";
			grep = "grep --color=auto";
		};
		initContent = ''
			export PATH="$HOME/.local/bin/:$PATH"
		'';
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "gitfast" ];
			custom = "${custom-prompt}/..";
			theme = "custom";
		};
	};
}
