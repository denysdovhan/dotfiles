
# Make new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# Get gzipped file size
function gz() {
  echo "Original size (bytes): "
  cat "$1" | wc -c
  echo "Gzipped size (bytes): "
  gzip -c "$1" | wc -c
}
