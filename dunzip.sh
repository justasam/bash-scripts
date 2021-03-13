#!/bin/bash

USAGE_INFO="Usage: dunzip [uri] [output?]"

if [ $# -ne 2 ] && [ $# -ne 1 ]
then
  echo $USAGE_INFO
  exit 0
fi

GET_URI=$1
FULL_NAME=$(basename -- "$1") # gets file name with extension
FILE_NAME="${FULL_NAME%.*}" # gets file name without extension -- folder name
SAVE_DIR="${2:-$FILE_NAME}" # if no output location provided uses parsed file name

if [ ! -d $SAVE_DIR ]
then
  echo "Directory $SAVE_DIR/ doesn't exist. Creating it..."
  mkdir $SAVE_DIR
fi


curl --show-error --location $1 | tar -xf - -C $SAVE_DIR
