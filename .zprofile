export PATH="$PATH:$HOME/.local/bin"
export EDITOR=$(which hx)
export SUDO_EDITOR=$(which hx)
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
export XCURSOR_PATH="$XCURSOR_PATH:$HOME/.local/share/icons"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  XDG_RUNTIME_DIR="/run/user/$(id -u)"

  mkdir -pm 0700 "$XDG_RUNTIME_DIR"
  export XDG_RUNTIME_DIR
fi

dbus-run-session niri --session
