
# LINUX SETTINGS
if [ "$(uname)" != "Darwin" ]; then
	alias pbcopy="xclip -selection c" 
	alias pbpaste="xclip -selection clipboard -o" 
        
	# keychain setup
        eval `ssh-agent`
        keychain
        ssh-add ~/.ssh/id*[!p][!u][!b]
fi

# MAC OSX SETTINGS
if [ "$(uname)" != "Darwin" ]; then
	alias ll="ls -plah"
fi
