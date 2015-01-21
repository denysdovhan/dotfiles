
# Override colors in terminal
PS1='\[\e[1;33m\]\u \[\e[1;37m\]at \[\e[1;31m\]\h \[\e[1;37m\]in \[\e[1;34m\]\w\[\e[0m\]\n\$ '

# Export PHP and MySQL commands into PATH
export PATH=$PATH:/opt/lampp/bin:/opt/lampp/


# WP-CLI
# bash completion for the `wp` command
_wp_complete() {
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

	if [[ "$opts" =~ \<file\>\s* ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	elif [[ $opts = "" ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	else
		COMPREPLY=( ${opts[*]} )
	fi
}
complete -o nospace -F _wp_complete wp
