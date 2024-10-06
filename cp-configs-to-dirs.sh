#!/bin/bash

# Function to copy a file to a directory
function copy_file_to_dir() {
  file="$1"
  dir="$2"

  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi

  cp "$file" "$dir"

  if [[ $? -eq 0 ]]; then
    echo "Copied '$file' to '$dir' successfully."
  else
    echo "Failed to copy '$file' to '$dir'."
  fi
}

# List of files and their corresponding directories
files_and_dirs=(
  "reflector.conf" "/etc/xdg/reflector/"
  ".bashrc" "$(getent passwd $SUDO_USER | cut -d: -f6)"
  "foot.ini" "$(getent passwd $SUDO_USER | cut -d: -f6)/.config/foot/"
  "lfrc" "$(getent passwd $SUDO_USER | cut -d: -f6)/.config/lf/"
)

# Copy each file to its respective directory
for (( i=0; i<${#files_and_dirs[@]}; i+=2 )); do
  file="${files_and_dirs[$i]}"
  dir="${files_and_dirs[$((i+1))]}"
  copy_file_to_dir "$file" "$dir"
done
