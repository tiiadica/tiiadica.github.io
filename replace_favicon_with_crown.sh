#!/bin/bash
# Script to replace favicon with user's pixelated crown image
# Usage: ./replace_favicon_with_crown.sh <path_to_crown_image>

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <path_to_crown_image>"
    echo "Example: $0 /path/to/my_pixelated_crown.png"
    exit 1
fi

CROWN_IMG="$1"
FAVICON_DIR="assets/images/favicon"

if [ ! -f "$CROWN_IMG" ]; then
    echo "Error: Image file '$CROWN_IMG' not found!"
    exit 1
fi

if [ ! -d "$FAVICON_DIR" ]; then
    echo "Error: Favicon directory '$FAVICON_DIR' not found!"
    echo "Make sure you're running this from the repository root."
    exit 1
fi

echo "🔄 Replacing favicon files with your pixelated crown image: $CROWN_IMG"

# Backup existing files
echo "📦 Creating backup..."
cp -r "$FAVICON_DIR" "${FAVICON_DIR}_backup_$(date +%Y%m%d_%H%M%S)"

# Generate all favicon formats
echo "🎨 Generating favicon files..."

# favicon.ico (multi-size)
convert "$CROWN_IMG" -resize 16x16 /tmp/favicon-16.png
convert "$CROWN_IMG" -resize 32x32 /tmp/favicon-32.png
convert "$CROWN_IMG" -resize 48x48 /tmp/favicon-48.png
convert /tmp/favicon-16.png /tmp/favicon-32.png /tmp/favicon-48.png "$FAVICON_DIR/favicon.ico"

# Individual PNG files
convert "$CROWN_IMG" -resize 16x16 "$FAVICON_DIR/favicon-16x16.png"
convert "$CROWN_IMG" -resize 32x32 "$FAVICON_DIR/favicon-32x32.png"
convert "$CROWN_IMG" -resize 180x180 "$FAVICON_DIR/apple-touch-icon.png"
convert "$CROWN_IMG" -resize 192x192 "$FAVICON_DIR/android-chrome-192x192.png"
convert "$CROWN_IMG" -resize 512x512 "$FAVICON_DIR/android-chrome-512x512.png"

# Clean up temp files
rm -f /tmp/favicon-*.png

echo "✅ Favicon files generated successfully!"
echo "📁 Files created in $FAVICON_DIR:"
ls -la "$FAVICON_DIR"

echo ""
echo "🚀 Your pixelated crown is now the favicon!"
echo "💡 The following files reference your favicon and should work automatically:"
echo "   - _includes/head.html"
echo "   - assets/images/favicon/site.webmanifest"
echo ""
echo "🌐 Deploy your site to see the new favicon in action!"