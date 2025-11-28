#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_qemu_setup.exe>"
    echo "Example: $0 qemu-w64-setup-20250826.exe"
    exit 1
fi

INPUT_EXE="$1"
OUTPUT_DIR="qemu-extracted"
LIST_FILE="qemu-files.txt"
TEMP_LIST="qemu-files-clean.txt"

# Check if list file exists
if [ ! -f "$LIST_FILE" ]; then
    echo "Error: $LIST_FILE not found!"
    exit 1
fi

# Check if 7z is installed
if ! command -v 7z &> /dev/null; then
    echo "Error: 7z is not installed. Please install it (e.g., sudo apt install 7zip)"
    exit 1
fi

# Clean the file list: convert from UTF-16 to UTF-8, remove CRLF, remove leading .\, and convert backslashes
# We use iconv to convert encoding (UTF-16 handles BOM) and tr/sed to handle line endings and paths
iconv -f UTF-16 -t UTF-8 "$LIST_FILE" | tr -d '\r' | sed 's|^\.\\||; s|\\|/|g' > "$TEMP_LIST"

# Extract files
echo "Extracting files from $INPUT_EXE to $OUTPUT_DIR..."
7z x "$INPUT_EXE" -o"$OUTPUT_DIR" -i@"$TEMP_LIST" -y

# Cleanup
rm "$TEMP_LIST"

# Zip the extracted folder
ZIP_FILE="${OUTPUT_DIR}.zip"
echo "Zipping $OUTPUT_DIR to $ZIP_FILE..."
# -tzip: create zip archive
# -mx=9: ultra compression
7z a -tzip -mx=9 "$ZIP_FILE" "$OUTPUT_DIR"

# Cleanup input exe and extracted folder
echo "Cleaning up $INPUT_EXE and $OUTPUT_DIR..."
rm "$INPUT_EXE"
rm -rf "$OUTPUT_DIR"

echo "Done! Files extracted and zipped to $ZIP_FILE"
