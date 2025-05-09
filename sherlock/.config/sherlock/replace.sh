#!/bin/bash
# Gruvbox Theme Variable Replacement Script - Using Custom Colors

# Function to display help
show_help() {
  echo "Usage: $0 <path_to_css_file> [--dark|--light] [--backup]"
  echo
  echo "Options:"
  echo "  --light     Use the light theme colors (latte, default)"
  echo "  --dark      Use the dark theme colors (mocha)"
  echo "  --backup    Create a backup of the original file before making changes"
  echo
  echo "This script replaces CSS variable references with custom Gruvbox-inspired theme values"
  exit 1
}

# Check if help is requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  show_help
fi

# Check if a file path is provided
if [ -z "$1" ]; then
  echo "Error: Missing file path"
  show_help
fi

FILE="$1"
CREATE_BACKUP=false
THEME="light"

# Process options
shift
while [ "$#" -gt 0 ]; do
  case "$1" in
    --backup)
      CREATE_BACKUP=true
      ;;
    --dark)
      THEME="dark"
      ;;
    --light)
      THEME="light"
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      ;;
  esac
  shift
done

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "Error: File not found: $FILE"
  exit 1
fi

# Create backup if requested
if [ "$CREATE_BACKUP" = true ]; then
  BACKUP_FILE="${FILE}.bak.$(date +%Y%m%d%H%M%S)"
  cp "$FILE" "$BACKUP_FILE"
  echo "Created backup: $BACKUP_FILE"
fi

# Define color mappings for both themes
if [ "$THEME" = "light" ]; then
  echo "Applying Light Theme (latte) colors..."
  
  # Convert hex to HSL values for better compatibility with your script format
  # These are approximations of the hex colors you provided
  declare -A color_mappings=(
    ["var(--background)"]="43, 71%, 92% /* Gruvbox light bg0 (#fbf1c7) */"
    ["var(--foreground)"]="40, 19%, 80% /* Gruvbox light bg0_s (#f2e5bc) */"
    ["var(--text)"]="24, 10%, 22% /* Gruvbox light fg0 (#3c3836) */"
    ["var(--border)"]="40, 23%, 75% /* Gruvbox light bg2 (#d5c4a1) */"
    ["var(--tag-background)"]="40, 23%, 75% /* Gruvbox light bg2 (#d5c4a1) */"
    ["var(--tag-color)"]="0, 0%, 15% /* Gruvbox dark text */"
    ["var(--error)"]="6, 57%, 44% /* Less saturated red (#b83229) */"
    ["var(--warning)"]="40, 67%, 40% /* Softer yellow (#b57e22) */"
    ["var(--success)"]="62, 58%, 31% /* Softer green (#7c7b20) */"
    ["var(--weather-clear)"]="151, 25%, 41% /* Softer teal (#4a8568) */"
    ["var(--weather-few-clouds)"]="151, 25%, 41% /* Softer teal (#4a8568) */"
    ["var(--weather-many-clouds)"]="191, 62%, 31% /* Softer blue (#1a7088) */"
    ["var(--weather-mist)"]="50, 11%, 80% /* Gruvbox light bg1 (#ebdbb2) */"
    ["var(--weather-showers)"]="191, 62%, 31% /* Softer blue (#1a7088) */"
    ["var(--weather-freezing-scattered-rain-storm)"]="196, 88%, 24% /* Gruvbox light blue (#076678) */"
    ["var(--weather-freezing-scattered-rain)"]="191, 62%, 31% /* Softer blue (#1a7088) */"
    ["var(--weather-snow-scattered-day)"]="43, 71%, 92% /* Gruvbox light bg0 (#fbf1c7) */"
    ["var(--weather-storm)"]="335, 47%, 32% /* Purple (#8f3f71) */"
    ["var(--weather-snow-storm)"]="40, 23%, 75% /* Gruvbox light bg2 (#d5c4a1) */"
    ["var(--weather-snow-scattered-storm)"]="196, 88%, 24% /* Gruvbox light blue (#076678) */"
    ["var(--weather-showers-scattered)"]="191, 62%, 31% /* Softer blue (#1a7088) */"
    ["var(--weather-none-available)"]="0, 0%, 65% /* Medium gray */"
  )
else
  echo "Applying Dark Theme (mocha) colors..."
  
  declare -A color_mappings=(
    ["var(--background)"]="0, 0%, 16% /* Gruvbox dark bg0 (#282828) */"
    ["var(--foreground)"]="0, 0%, 20% /* Gruvbox dark bg0_s (#32302f) */"
    ["var(--text)"]="38, 16%, 66% /* Gruvbox dark fg0 (darkened) (#bfb191) */"
    ["var(--border)"]="0, 0%, 28% /* Gruvbox dark bg2 (#504945) */"
    ["var(--tag-background)"]="0, 0%, 28% /* Gruvbox dark bg2 (#504945) */"
    ["var(--tag-color)"]="40, 33%, 77% /* Gruvbox dark beige (#d5c4a1) */"
    ["var(--error)"]="6, 69%, 65% /* Gruvbox dark red (#ea6962) */"
    ["var(--warning)"]="37, 53%, 59% /* Gruvbox dark yellow (#d8a657) */"
    ["var(--success)"]="80, 28%, 55% /* Gruvbox dark green (#a9b665) */"
    ["var(--weather-clear)"]="144, 29%, 53% /* Gruvbox dark aqua (#89b482) */"
    ["var(--weather-few-clouds)"]="144, 29%, 53% /* Gruvbox dark aqua (#89b482) */"
    ["var(--weather-many-clouds)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-mist)"]="40, 33%, 77% /* Gruvbox dark bg1 (#d5c4a1) */"
    ["var(--weather-showers)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-freezing-scattered-rain-storm)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-freezing-scattered-rain)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-snow-scattered-day)"]="38, 52%, 86% /* Gruvbox beige (#d4be98) */"
    ["var(--weather-storm)"]="328, 35%, 70% /* Gruvbox dark purple (#d3869b) */"
    ["var(--weather-snow-storm)"]="40, 33%, 77% /* Gruvbox dark bg1 (#d5c4a1) */"
    ["var(--weather-snow-scattered-storm)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-showers-scattered)"]="169, 24%, 55% /* Gruvbox dark blue (#7daea3) */"
    ["var(--weather-none-available)"]="0, 0%, 65% /* Medium gray */"
  )
fi

echo "Processing $FILE with custom ${THEME^} theme values..."

# Apply all color replacements
for var in "${!color_mappings[@]}"; do
  sed -i "s|${var}|${color_mappings[$var]}|g" "$FILE"
done

# Remove specific lines
echo "Removing unnecessary variables..."
sed -i '/--text-alternate/d' "$FILE"
sed -i '/--width/d' "$FILE"

# Remove commented alternative color blocks
echo "Cleaning up comment blocks..."
sed -i '/\/\*$/,/\*\//d' "$FILE"

echo "Transformation complete!"
echo "The CSS file now uses custom Gruvbox-inspired ${THEME^} theme colors in HSL format."
