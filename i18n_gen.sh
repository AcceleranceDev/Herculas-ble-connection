#!/bin/bash

echo "Creating lib/locale/app_localizations.dart in 'lib' folder"

# Define the path to search for i18n folders
# Need to define the project path as Search Paths
SEARCH_PATH=../../Projetcs/herculas_ble_connection

# Define the name of the output dart file
## Create a new File in the project @ path lib/locale/app_localization
OUTPUT_FILE=lib/locale/app_localizations.dart

# Find all i18n folders and store their names in an array
I18N_FOLDERS=($(find $SEARCH_PATH -type d -name "i18n" -not -path "*/build/*"))

# Base Language
BASE_LANGUAGE=en

# Create the output dart file and add the initial code
## WIll Create a new class in the project file
echo "class AppLocalizations {" > $OUTPUT_FILE
#echo "" >> $OUTPUT_FILE

# Loop through each i18n folder and extract the keys of its JSON files
for folder in "${I18N_FOLDERS[@]}"
do
  # Find all JSON files inside the i18n folder and store their names in an array
#  JSON_FILES=($(find /path/to//Projetcs/herculas_ble_connection/i18n -type f -name "$BASE_LANGUAGE.json"))
  JSON_FILES=($(find $folder -type f -name "$BASE_LANGUAGE.json"))


  # Loop through each JSON file and extract its keys
  for file in "${JSON_FILES[@]}"
  do
    # Extract the basename of the file
    filename=$(basename -- "$file")
    echo "file $file"

    # Remove the ".json" extension to get the variable name
    varname="${filename%.*}"

    # Add the variable declaration to the output dart file
    #echo "  static const Map<String, String> ${varname/camelCase} = {" >> $OUTPUT_FILE

    # Convert the JSON keys to camelCase and add them as constants to the output dart file
    jq -r 'def to_camel_case: ascii_downcase | split("_") | .[0:1] + (.[1:] | map( (.[0:1] | ascii_upcase ) + .[1:])) | join(""); def to_space: ascii_downcase | split(" ") | .[0:1] + (.[1:] | map( (.[0:1] | ascii_upcase ) + .[1:])) | join(""); to_entries[] | "  static const String \(.key | to_camel_case) = \"\(.key)\";"' $file >> $OUTPUT_FILE

    # Close the variable declaration
    #echo "  };" >> $OUTPUT_FILE
    #echo "" >> $OUTPUT_FILE
  done

done


# Add the closing bracket of the I18nKeys class
echo "}" >> $OUTPUT_FILE

# Export the app_localizations.dart
filename="lib/locale/app_localizations.dart"

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "$filename does not exist"
    exit 1
fi

# Check if file already contains the text
if grep -q "export 'lib/locale/app_localizations.dart';" "$filename"; then
    exit 0
#else
    # Append the text to the end of the file
#    echo "export 'lib/app_localizations.dart';" >> "$filename"
fi

echo "Successfully created the file. Please don't forget to add it to GIT tracking if required."