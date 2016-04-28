#!/usr/bin/env bash

# Add OSX-like shadow to image
# USAGE: osx-shadow [--rm|-r] <original.png> [result.png]

# Help message
function help {
  echo "Wrong number of arguments have been entered."
  echo "USAGE: add-shadow [--rm|-r] <original.png> [result.png]"
  exit
}

if [ $1 != "--rm" ] || [ $1 != "-r" ]; then
  # Add shadow
  case $# in
    2 ) # osx-shadow src.png dist.png
      convert $1 \( +clone -background black -shadow 80x20+0+15 \) +swap -background transparent -layers merge +repage $2
      ;;
    1 ) # osx-shadow src.png
      convert $1 \( +clone -background black -shadow 80x20+0+15 \) +swap -background transparent -layers merge +repage ${1%.*}-shadow.png
      ;;
    * )
      help
      ;;
  esac
else
  # Remove shadow
  case $# in
    3 ) # osx-shadow --rm|-r src.png dist.png
      convert $2 -crop +40+25 -crop -40-55 $3
      ;;
    2 ) # osx-shadow --rm|-r src.png
      convert $2 -crop +40+25 -crop -40-55 ${2%.*}-croped.png
      ;;
    * )
      help
      ;;
  esac
fi
