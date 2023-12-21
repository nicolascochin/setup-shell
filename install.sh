#!/bin/bash 

[ ! -f /etc/arch-release ] && echo "This script only runs on arch linux" && exit 1

# $1 == cmd
function is_installed {
  if command -v $1 > /dev/null; then 
    echo "$1 is already installed"
    true
  else 
    false
  fi
}

# ===== YAY/PACMAN ====== 
echo "Setup yay"
! is_installed yay && (
  echo "Installing yay"
  sudo pacman -S yay
)
PACMAN_CONF_FILE=/etc/pacman.conf
grep -qe "^#Color" $PACMAN_CONF_FILE && (
  echo "Activating Colors for pacman / yay"
  sudo sed -i 's/^#\(Color\)/\1/' $PACMAN_CONF_FILE
)
grep -qe "^#ParallelDownloads" $PACMAN_CONF_FILE && (
  echo "Activating ParallelDownloads for pacman / yay"
  sudo sed -i 's/^#\(ParallelDownloads\)/\1/' $PACMAN_CONF_FILE
)
# Chaotic aur
! grep -qe "^\[chaotic-aur\]" $PACMAN_CONF_FILE && (
  echo "Installing chaotic-aur"
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 
  sudo cat <<EOL | sudo tee -a $PACMAN_CONF_FILE

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOL
)

# ===== Fish ====== 
echo "Setup Fish"
! is_installed fish && (
  echo "Installing Fish"
  sudo pacman -S fish
)
! is_installed fisher && (
  echo "Installing Fisher"
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
)
FISHER_PLUGINS="
ilancosman/tide@v6
dracula/fish
patrickf1/fzf.fish
"
for PLUGIN in $FISHER_PLUGINS; do 
  echo "Install plugin $PLUGIN"
  fish -c "fisher install $PLUGIN"
done

DEPENDENCIES="
  fzf
  fd
  bat
  bat-extras
"
echo "Install dependencies"
sudo pacman -S $DEPENDENCIES

echo "Set fish the default terminal"
chsh -s /bin/fish

# == GNOME TERMINAL
echo "Setup gnome terminal TODO"


# ===== GITHUB CLI ====== 
echo "Setup GitHub CLI"
! is_installed gh && (
  echo "Installing GitHub CLI"
  sudo pacman -S github-cli
)
if [[ $(gh auth status 2>&1) =~ "not logged" ]]; then 
  echo "You are not logged in"
  gh auth login 
fi
