#! /usr/bin/env bash

segments::path() {
  local segment_max_length=$SEGMENTS_MAX_LENGTH

  local wdir=${PWD/${HOME}/\~}

  IFS=/ read -r -a wdir_array <<<"${wdir}"
  if [[ $SEGMENTS_PATH_SPLITTER_DISABLE -ne 1 && ${#wdir_array[@]} -gt 1 ]]; then
    declare -a segments
    for dir in "${wdir_array[@]}"; do
      if [[ -n $dir ]]; then
        segments+=("$dir")
      fi
    done
    print_themed_segment 'normal' "${segments[@]}"
  else
    print_themed_segment 'normal' "$wdir"
  fi
}
