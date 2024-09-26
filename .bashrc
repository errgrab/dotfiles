# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
print_error() {
	ERROR=$?
	if [ $ERROR -ne 0 ]; then
		echo -e "\033[0;31m[$ERROR] ";
	fi
}
export PS1="\[\e[0;32m\]\$(print_error)\W \[\e[0m\]"

# Path
export PATH="$HOME/.local/bin/:$PATH"
export GPG_TTY=$(tty)

# Aliases
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias francinette='/home/anon/francinette/tester.sh'
alias paco='/home/anon/francinette/tester.sh'
alias norm='norminette'
