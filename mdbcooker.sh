#!/bin/bash
#MDBCOOKER
# Check if both MDB file and keyword arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <path_to_mdb_file> <keyword_to_search>"
    exit 1
fi

# Path to your MDB file (from the first argument)
MDB_FILE="$1"

# Keyword to search for (from the second argument)
KEYWORD="$2"

# Get the list of tables dynamically from the MDB file
TABLES=$(mdb-tables "$MDB_FILE")

# Variable to store tables with matches
MATCHED_TABLES=()

# Display the starting message once
echo "[+] Checking tables. . . ."

# Iterate through each table
for table in $TABLES; do
    # Export the full table data to CSV
    mdb-export "$MDB_FILE" "$table" > "$table.csv"

    # If the CSV contains the keyword, keep it
    if grep -a -i "$KEYWORD" "$table.csv" > /dev/null; then
        MATCHED_TABLES+=("$table")  # Add matched table to the list

        # Display message to show cooking data
        echo "[+] Cooking data. . . ."
        sleep 2  # 2-second delay
    else
        # Remove the CSV if no match was found
        rm "$table.csv"
    fi
done

# After completing the search, display results
if [ ${#MATCHED_TABLES[@]} -gt 0 ]; then
    for table in "${MATCHED_TABLES[@]}"; do
        echo "[!]KEYWORD FOUND IN -> $table"
    done
else
    echo "[+] No matches found for keyword: $KEYWORD"
fi



