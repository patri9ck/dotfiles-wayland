#!/bin/sh

main_directory="$(dirname "$(dirname "$(readlink -f "$0")")")"

packages() {
	sudo pacman -S --needed base-devel git

	git clone https://aur.archlinux.org/paru-bin.git
	
	cd paru-bin

	makepkg -sirc --needed	
	
	cd -

	rm -rf paru-bin

	paru -S --needed $(grep -h -v '^#' "$main_directory/meta/packages.txt" "$main_directory/meta/packages-$1.txt")
}

dotfiles() {
	ignored_directories=".git\nmeta"
	ignored_files="README.md"

	for file in $(find "$main_directory" -type f)
	do
		directory="$(dirname "$(echo $file | cut -c$(($(echo -n "$main_directory" | wc -m) + 2))-)")"

		if echo "$ignored_directories" | grep -qx "$(echo -n "$directory" | cut -d / -f 1)"
		then
			continue
		fi

		if [ "$directory" = "." ] && echo "$ignored_files" | grep -qx "$(basename "$file")"
		then
			continue
		fi

		mkdir -p "$HOME/$directory"

		ln -fs "$file" "$HOME/$directory"
	done
}

case "$1" in
	packages)
		packages "$2"
		;;
	dotfiles)
		dotfiles
		;;
	*)
		exit 1
		;;
esac
