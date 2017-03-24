#!/bin/bash

# Import .env file
source .env

echo "VOLUME_FOLDER_LIST=$VOLUME_FOLDER_LIST" 
echo "PROSPECT_FILE_PATTERN_LIST=$PROSPECT_FILE_PATTERN_LIST"



# docker-compose.yml
if [-f "./docker-compose.yml"]; then
	echo "./docker-compose.yml exists. Removed/re-generated it."
	rm ./docker-compose.yml
fi

# Generate docker=compose.ynl file
cp .docker-compose.yml.basic docker-compose.yml

for path in $VOLUME_FOLDER_LIST
do
	echo "      - $path:$path" >> docker-compose.yml
done


# filebeat.yml
if [-f "./filebeat.yml"]; then
	echo "./filebeat.yml exists. Removed/re-generated it."
	rm ./filebeat.yml
fi

# Generate filebeat.yml file
cp .filebeat.yml.part1 filebeat.yml

for file_pattern in $PROSPECT_FILE_PATTERN_LIST
do
	echo "   - $file_pattern" >> filebeat.yml
done

# append .filebeat.ynl.part2
cat .filebeat.yml.part2 >> filebeat.yml

ls -ltr *.yml
