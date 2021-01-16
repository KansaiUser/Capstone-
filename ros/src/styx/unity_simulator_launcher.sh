#!/bin/bash
#
# Script to launch the CarND Unity simulator

THIS_DIR="$(cd "$(dirname "$0")" && pwd -P && cd - > /dev/null)"
USER_PROFILE="$THIS_DIR/profile.tmp"

echo "Script to launch the CarND Unity Simulator"
echo $THIS_DIR
echo $USER_PROFILE

if [ ! -f "$USER_PROFILE" ];  #The file does not exist
  then
    echo "What is the full path to your Unity simulator?"
    read unity_path

    echo "Unity path: "
    echo $unity_path

    # write to the file
    echo "$unity_path" > $USER_PROFILE
  else
    unity_path=$(cat "$USER_PROFILE")
    echo $unity_path
fi

$unity_path
