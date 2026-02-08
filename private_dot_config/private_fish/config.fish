if status is-interactive
    # Commands to run in interactive sessions can go here

end

alias gt="go test -run"
xhost +SI:localuser:$(whoami)
alias ls="lsd"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

export XCURSOR_SIZE=24
export GDK_SCALE=1
export GDK_DPI_SCALE=1.5
export QT_SCALE_FACTOR=1.5
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORM=wayland
set -U fish_user_paths $fish_user_paths (go env GOPATH)/bin
