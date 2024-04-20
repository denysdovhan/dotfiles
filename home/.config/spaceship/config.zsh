# dir
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_DIR_TRUNC=5
SPACESHIP_DIR_TRUNC_PREFIX="…/"

# sudo
SPACESHIP_SUDO_COLOR="red"
SPACESHIP_SUDO_SHOW=true

# time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_TIME_FORMAT='%D{%a %H:%M}'
SPACESHIP_TIME_PREFIX="on "
SPACESHIP_TIME_COLOR="green"

# jobs
SPACESHIP_JOBS_AMOUNT_THRESHOLD=0

# xcode
SPACESHIP_XCODE_SYMBOL="⚒·" # "🛠·"

# battery
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=99

# exit_code
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL="✘ "

# exec_time
SPACESHIP_EXEC_TIME_ELAPSED=1 #sec
SPACESHIP_EXEC_TIME_PRECISION=0

# git
SPACESHIP_GIT_BRANCH_COLOR="magenta"
SPACESHIP_GIT_PREFIX=""

# line_sep
SPACESHIP_PROMPT_SEPARATE_LINE=true

# char
SPACESHIP_CHAR_SYMBOL="➜ "
SPACESHIP_CHAR_SYMBOL_ROOT="# ➜ "

# generic config
SPACESHIP_PROMPT_ADD_NEWLINE=true

# Default order - https://spaceship-prompt.sh/config/prompt/#Prompt-order

# Left prompt, split by new line
SPACESHIP_PROMPT_ORDER=(
  # Remote sessions
  user
  host
  # Current dir
  dir
  # Binary versions
  package
  node
  bun
  python
  venv
  xcode
  swift
  lua
  dotnet
  nix_shell
  # Prompt line
  line_sep # Line Separator
  jobs # Shows background jobs
  sudo # Shows lightning symbol if sudo
  char # Prompt character
)

# Right prompt, can't be split
SPACESHIP_RPROMPT_ORDER=(
  exit_code
  async
  git
  exec_time
  time
  battery
)


