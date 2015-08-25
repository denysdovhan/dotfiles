# Print cyan underlined header
# USAGE: header <TEXT>
function header() {
  echo -e "$UNDERLINE$CYAN$1$NOCOLOR"
}

# Print red underlined error
# USAGE: error <TEXT>
function error() {
  echo -e "$UNDERLINE$RED$1$NOCOLOR";
}

# Open file from terminal
# USAGE: open <FILE>
function open() {
  echo $1
  xdg-open $1 </dev/null &>/dev/null &
}

# Find shorthand
# USAGE: f <FILE>
function f() {
  find . -name "$1"
}

# Make new directory and enter it
# USAGE: md <DIR>
function md() {
  mkdir -p "$@" && cd "$@"
}

# Get gzipped file size
# USAGE: gz <FILE>
function gz() {
  local origsize=`wc -c < $1`
  local gzipsize=`gzip -c $1 | wc -c`
  local ratio=`echo $(( $gzipsize * 100 / $origsize ))`
  echo "Original: $origsize bytes"
  echo "Gzipped: $gzipsize bytes ($ratio%)"
}

# Extract archives of various types
# USAGE: extract <FILE>
function extract() {
  if [ -f $1 ] ; then
    local dir_name=${1%.*}  # Filename without extension
    case $1 in
      *.tar.bz2)  tar xjf           $1 ;;
      *.tar.gz)   tar xzf           $1 ;;
      *.tar.xz)   tar Jxvf          $1 ;;
      *.tar)      tar xf            $1 ;;
      *.tbz2)     tar xjf           $1 ;;
      *.tgz)      tar xzf           $1 ;;
      *.bz2)      bunzip2           $1 ;;
      *.rar)      unrar x           $1 $2 ;;
      *.gz)       gunzip            $1 ;;
      *.zip)      unzip -d$dir_name $1 ;;
      *.Z)        uncompress        $1 ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Get sh usage stats
# USAGE: sh_stats
sh_stats () {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

# Add remote upsteam
# USAGE: git-fork <original-author>
function git-fork() {
  local user=$1
  if [[ "$user" == "" ]]
  then
    echo "Usage: git-fork <original-author>"
  else
    local repo=`basename "$(pwd)"`
    git remote add upstream "https://github.com/$user/$repo.git"
  fi
}

# Sync branch with upstream
# USAGE: git-upstream [branch]
function git-upstream() {
  branch=${1-master}
  git fetch upstream
  git co origin $branch
  git merge upstream/$branch
}

# Add OSX-like shadow to image
# USAGE: add-shadow <original.png> [result.png]
function add-shadow() {
  case $# in
    2 ) # add-shadow src.png dist.png
      convert $1 \( +clone -background black -shadow 80x20+0+15 \) +swap -background transparent -layers merge +repage $2
      ;;
    1 ) # add-shadow src.png
      convert $1 \( +clone -background black -shadow 80x20+0+15 \) +swap -background transparent -layers merge +repage ${1%.*}-shadow.png
      ;;
    * )
      echo "Wrong number of arguments have been entered."
      exit
      ;;
  esac
}

# Remove OSX-like shadow
# USAGE: rm-shadow <original.png> [result.png]
function rm-shadow() {
  case $# in
    2 ) # rm-shadow src.png dist.png
      convert $1 -crop +40+25 -crop -40-55 $2
      ;;
    1 ) # rm-shadow src.png
      convert $1 -crop +40+25 -crop -40-55 ${1%.*}-croped.png
      ;;
    * )
      echo "Wrong number of arguments have been entered."
      exit
      ;;
  esac
}

# Print nyan cat
# https://github.com/steckel/Git-Nyan-Graph/blob/master/nyan.sh
# USAGE: nyan
function nyan() {
  echo
  echo -en $RED'-_-_-_-_-_-_-_'
  echo -e $NOCOLOR$BOLD',------,'$NOCOLOR
  echo -en $YELLOW'_-_-_-_-_-_-_-'
  echo -e $NOCOLOR$BOLD'|   /\_/\\'$NOCOLOR
  echo -en $GREEN'-_-_-_-_-_-_-'
  echo -e $NOCOLOR$BOLD'~|__( ^ .^)'$NOCOLOR
  echo -en $CYAN'-_-_-_-_-_-_-_-'
  echo -e $NOCOLOR$BOLD'""  ""'$NOCOLOR
  echo
}
