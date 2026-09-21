#
# tmux command lifecycle passthrough
#
# Terminal-native command notifications measure work between OSC 133 C and D
# markers. tmux drops raw OSC sequences, so these Zsh hooks wrap the markers in
# tmux's DCS passthrough format and double every ESC in the payload. The outer
# terminal owns timing and notification policy; this file only forwards markers.
# allow-passthrough is enabled in ~/.tmux.conf so hidden windows work too.

if [[ -o interactive && -t 0 && -t 1 && -n "$TMUX" ]]; then
  _tmux_osc133() {
    local sequence=$'\e]133;'"$1"$'\a'
    local escape=$'\e'
    local escaped=$'\e\e'
    printf '\ePtmux;%s\e\\' "${sequence//$escape/$escaped}"
  }

  _tmux_command_preexec() { _tmux_osc133 C }
  _tmux_command_precmd() { local exit_status=$?; _tmux_osc133 "D;$exit_status" }

  autoload -Uz add-zsh-hook
  add-zsh-hook preexec _tmux_command_preexec
  add-zsh-hook precmd _tmux_command_precmd
fi
