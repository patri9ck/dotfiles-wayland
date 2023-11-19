export PATH="$PATH:$HOME/Android/Sdk/platform-tools"

export HOSTNAME="$(hostname)"

if [ "$HOSTNAME" = notebook ]
then
	export WEBCAM='Integrated Camera'

	export VPN_INTERFACE=wg0
elif [ "$HOSTNAME" = desktop ]
then
	export WEBCAM='USB Web Camera'

	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	
	export PATH="$PATH:$GEM_HOME/bin"
fi

export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
export WLR_NO_HARDWARE_CURSORS=1

export EDITOR=nvim

export SAVEHIST=99
export HISTSIZE=99
export HISTFILE="$HOME/.history"

# IMGUR_API_KEY
. "$HOME/.secrets"
