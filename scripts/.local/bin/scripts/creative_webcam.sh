#!/bin/bash

# List all the controls with:
#   v4l2-ctl --device=/dev/video4 --list-ctrls

device="/dev/video4"

exposure_auto=true 
# if exposure_auto is true, the camera will automatically adjust the exposure time
exposure_time_absolute=200 # default: 512 (156 to 5000)

brightness=0  # default: 0 (-10 to 10)
contrast=12    # default: 15 (1 to 32)
saturation=12  # default: 10 (0 to 20)
gamma=192      # default: 192 (100 to 200)
sharpness=3    # default: 7 (0 to 10)

set_controls() {
  cmd="v4l2-ctl -d $device --set-ctrl"

  if $exposure_auto; then
      $cmd auto_exposure=3
  else
      $cmd auto_exposure=1
      $cmd exposure_time_absolute=200 # default: 512 (156 to 5000)
  fi

  $cmd brightness=$brightness 
  $cmd contrast=$contrast
  $cmd saturation=$saturation
  $cmd gamma=$gamma
  $cmd sharpness=$sharpness
}
set_controls
