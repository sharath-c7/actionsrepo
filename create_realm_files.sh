#!/bin/bash

# Check if input is provided
if [ -z "$1" ]; then
    echo "Please provide realm data in format: \"realm1\": \"id1\", \"realm2\": \"id2\""
    exit 1
fi

# Store the input
realm_data="$1"

# Process each realm entry
echo "$realm_data" | tr ',' '\n' | while IFS=: read -r realmname realmid; do
    # Remove quotes and trim whitespace
    realmname=$(echo "$realmname" | tr -d '"' | xargs)
    realmid=$(echo "$realmid" | tr -d '"' | xargs)
    
    # Skip empty lines
    if [ -z "$realmname" ] || [ -z "$realmid" ]; then
        continue
    fi
    
    # Create YAML file
    cat > "${realmname}.yaml" << EOF
name: $realmname
id: $realmid
EOF

    echo "Created ${realmname}.yaml"
done 