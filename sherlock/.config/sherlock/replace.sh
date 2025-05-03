#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_css_file>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "File not found!"
  exit 1
fi

FILE="$1"

# Replace all instances of the color variables with their corresponding values

sed -i 's|var(--background)|0, 0%, 9% /* <- replaced */|' $FILE
sed -i 's|var(--foreground)|0, 0%, 15% /* <- replaced */|' $FILE
sed -i 's|var(--text)|53, 100%, 97% /* <- replaced */|' $FILE
sed -i 's|var(--border)|0, 0%, 19% /* <- replaced */|' $FILE

sed -i 's|var(--tag-background)|180, 0%, 30% /* <- replaced */|' $FILE
sed -i 's|var(--tag-color)|220, 10%, 100% /* <- replaced */|' $FILE
sed -i 's|var(--error)|4, 71%, 62% /* <- replaced */|' $FILE
sed -i 's|var(--warning)|55, 100%, 68% /* <- replaced */|' $FILE
sed -i 's|var(--success)|140, 40%, 40% /* <- replaced */|' $FILE

sed -i 's|var(--weather-clear)|210, 60%, 70% /* <- replaced */|' $FILE
sed -i 's|var(--weather-few-clouds)|210, 30%, 85% /* <- replaced */|' $FILE
sed -i 's|var(--weather-many-clouds)|220, 0%, 70% /* <- replaced */|' $FILE
sed -i 's|var(--weather-mist)|60, 10%, 80% /* <- replaced */|' $FILE
sed -i 's|var(--weather-showers)|200, 10%, 50% /* <- replaced */|' $FILE
sed -i 's|var(--weather-freezing-scattered-rain-storm)|220, 30%, 35% /* <- replaced */|' $FILE
sed -i 's|var(--weather-freezing-scattered-rain)|220, 40%, 45% /* <- replaced */|' $FILE
sed -i 's|var(--weather-snow-scattered-day)|200, 40%, 95% /* <- replaced */|' $FILE
sed -i 's|var(--weather-storm)|240, 10%, 20% /* <- replaced */|' $FILE
sed -i 's|var(--weather-snow-storm)|210, 20%, 92% /* <- replaced */|' $FILE
sed -i 's|var(--weather-snow-scattered-storm)|210, 10%, 25% /* <- replaced */|' $FILE
sed -i 's|var(--weather-showers-scattered)|200, 30%, 65% /* <- replaced */|' $FILE
sed -i 's|var(--weather-none-available)|0, 0%, 50% /* <- replaced */|' $FILE

# Remove lines containing --text-alternate
# Remove lines containing --width
sed -i 's|var(--text-alternate)|0, 0%, 100% /* <- replaced */|' $FILE
sed -i 's|var(--width)|0, 0%, 100% /* <- replaced */|' $FILE
