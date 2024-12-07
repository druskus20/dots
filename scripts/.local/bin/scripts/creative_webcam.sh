#!/bin/bash

# List all the controls with:
#   v4l2-ctl --device=/dev/video4 --list-ctrls

device="/dev/video4"

exposure_auto=false 
# if exposure_auto is true, the camera will automatically adjust the exposure time
exposure_time_absolute=300 # default: 512 (156 to 500)

brightness=-1  # default: 0 (-10 to 10)
contrast=12    # default: 15 (1 to 32)
saturation=15  # default: 10 (0 to 20)
gamma=150      # default: 192 (100 to 200)
sharpness=3    # default: 7 (0 to 10)

set_controls() {
  cmd="v4l2-ctl -d $device --set-ctrl"

  if $exposure_auto; then
      $cmd auto_exposure=3
  else
      $cmd auto_exposure=1
      $cmd exposure_time_absolute=$exposure_time_absolute # default: 512 (156 to 5000)
  fi

  $cmd brightness=$brightness 
  $cmd contrast=$contrast
  $cmd saturation=$saturation
  $cmd gamma=$gamma
  $cmd sharpness=$sharpness
}
set_controls
