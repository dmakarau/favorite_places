#!/bin/bash

# Script to generate Keys.plist from environment variables
# This will be run during the build process

ENV_FILE="../../.env"
KEYS_FILE="../Runner/Keys.plist"

# Create the Keys.plist file
cat > "$KEYS_FILE" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>GOOGLE_MAPS_API_KEY</key>
    <string>YOUR_API_KEY_HERE</string>
</dict>
</plist>
EOF

# If .env file exists, read the API key from it
if [ -f "$ENV_FILE" ]; then
    # Extract the API key from .env file
    API_KEY=$(grep "GOOGLE_MAPS_API_KEY=" "$ENV_FILE" | cut -d '=' -f2 | tr -d '"' | tr -d "'")
    
    if [ ! -z "$API_KEY" ] && [ "$API_KEY" != "your_google_maps_api_key_here" ]; then
        # Replace the placeholder with the actual API key
        sed -i.bak "s/YOUR_API_KEY_HERE/$API_KEY/g" "$KEYS_FILE"
        rm "${KEYS_FILE}.bak"
        echo "✅ Generated Keys.plist with API key from .env file"
    else
        echo "⚠️  No valid API key found in .env file, using placeholder"
    fi
else
    echo "⚠️  .env file not found, using placeholder API key"
fi