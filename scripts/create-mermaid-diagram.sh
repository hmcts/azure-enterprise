brew_installed=$(which brew | grep -o brew > /dev/null &&  echo 0 || echo 1)

if [ $brew_installed = 1 ]; then
    echo "Homebrew is missing. Please install brew before continuing"
    exit 1
fi

platform=$(uname)

if [ $platform == "Darwin" ]; then
    packages=(gawk gsed yj jq)
    for i in "${packages[@]}"
    do
        installed=$(which $i | grep -o $i > /dev/null &&  echo 0 || echo 1)
        if [ $installed = 1 ]; then
            echo "${i} is missing! Brew will attempt to install it..."
            brew install ${i}
        else
            awk_command=$(which gawk)
            sed_command=$(which gsed)
        fi
    done
elif [ $platform == "Linux" ]; then
    packages=(awk sed yj jq)
    for i in "${packages[@]}"
    do
        installed=$(which $i | grep -o $i > /dev/null &&  echo 0 || echo 1)
        if [ $installed = 1 ]; then
            echo "${i} is missing! Brew will attempt to install it..."
            brew install ${i}
        else
            awk_command=$(which awk)
            sed_command=$(which sed)
        fi
    done
fi

# convert hcl to json
yj -c < ./environments/prod/prod.tfvars > /tmp/prod.json

# filter to only include subscription group variables (ending with _subscriptions)
jq 'with_entries(select(.key | endswith("_subscriptions")))' /tmp/prod.json > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# extract only subscription names (keys) from each subscription group, ignore properties
jq -r 'to_entries[] | .key as $group_name | .value[] | to_entries[] | "\($group_name), \(.key)"' /tmp/prod.json > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# remove any empty lines
grep -v '^$' /tmp/prod.json > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# format the output into mermaid syntax
$sed_command -i 's/\, / --> /g; s/\"//g' /tmp/prod.json

# rename management groups and create proper hierarchy
$sed_command -i 's/_subscriptions//g' /tmp/prod.json
$sed_command -i 's/_sandbox/-Sandbox/g' /tmp/prod.json
$sed_command -i 's/_non_production/-NonProd/g' /tmp/prod.json
$sed_command -i 's/_production/-Prod/g' /tmp/prod.json
$sed_command -i 's/\b\(.\)/\u\1/g' /tmp/prod.json
$sed_command -i 's/Cft/CFT/g; s/Sds/SDS/g; s/Vh/VH/g' /tmp/prod.json

# Group subscriptions by their full management group name (including environment)
# and preserve the order from the original file
$awk_command -F' --> ' '
{
    mg = $1
    # Keep the full management group name including environment suffix
    if (!(mg in seen)) {
        order[++count] = mg
        seen[mg] = 1
    }
    subs[mg] = (subs[mg] ? subs[mg] " --- " : "") $2
}
END {
    # Output in the order first encountered
    for (i = 1; i <= count; i++) {
        mg = order[i]
        print mg ":::mg --> " subs[mg]
    }
}' /tmp/prod.json > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# Create complete hierarchy with management groups
{
    echo 'graph TD'
    echo 'classDef mg stroke:#ff1100,stroke-width:4px'
    echo 'Root:::mg --> HMCTS'
    echo 'HMCTS:::mg --> Security:::mg'
    echo 'HMCTS:::mg --> Crime:::mg'
    echo 'HMCTS:::mg --> CFT:::mg'
    echo 'HMCTS:::mg --> Heritage:::mg'
    echo 'HMCTS:::mg --> Platform:::mg'
    echo 'HMCTS:::mg --> SDS:::mg'

    # Add environment level relationships
    for base in SDS Platform Heritage CFT; do
        echo "$base --> $base-Sandbox:::mg"
        echo "$base --> $base-Prod:::mg"
        echo "$base --> $base-NonProd:::mg"
    done

    # Add the subscription relationships
    cat /tmp/prod.json
} > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# Handle Crime subscriptions with spaces in names - simpler approach
$sed_command -i '/^Crime:::mg/ {
    s/ --> / --> Crime1[/
    s/ --- /] --- Crime[/g
    s/$/]/
    s/ ]/]/g
}' /tmp/prod.json

# Add sequential numbering to Crime subscriptions
$awk_command -i inplace '/^Crime:::mg/ {
    # Use a different approach - split the line and rebuild it with proper numbering
    line = $0
    # Remove the "Crime:::mg --> " part
    sub(/^Crime:::mg --> /, "", line)

    # Split by " --- " to get individual subscriptions
    split(line, parts, " --- ")

    # Rebuild the line with proper numbering
    result = "Crime:::mg --> "
    for (i = 1; i <= length(parts); i++) {
        if (i > 1) result = result " --- "
        # Remove any existing Crime prefix and add the correct number
        sub(/^Crime[0-9]*\[/, "", parts[i])
        result = result "Crime" i "[" parts[i]
    }
    print result
    next
}
{print}' /tmp/prod.json

# Clean up any extra spaces
$sed_command -i 's/[ ][ ]*/ /g' /tmp/prod.json
$sed_command -i '/^$/d' /tmp/prod.json

# Add mermaid code block wrapper
{
    echo '```mermaid'
    cat /tmp/prod.json
    echo '```'
} > /tmp/prod2.json && mv /tmp/prod2.json /tmp/prod.json

# replace current mermaid code block in README with updated content
$sed_command -i -e '/```mermaid/{:a; N; /\n```$/!ba; r /tmp/prod.json' -e 'd;}' README.md

