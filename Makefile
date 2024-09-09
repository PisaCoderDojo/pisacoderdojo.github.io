
# Define the folder_ORIGINALS containing the original (coloured) images of the mentors
FOLDER_ORIGINALS = ./static/mentors/originals
# Define the JSON file
JSON_FILE = ./data/mentors_actual.json

# Target to convert the image to grayscale using ImageMagick https://imagemagick.org/script/download.php
.PHONY: grayscale
grayscale:
	IMAGES=$$(find ${FOLDER_ORIGINALS} -type f \( -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.png" \)); \
	for img in $$IMAGES; do \
		filename=$$(basename "$$img"); \
		echo "Processing image: $$img with name $$filename"; \
		magick "$$img" -colorspace Gray "./static/mentors/$$filename"; \
	done


# Target to check if iamges in the json file exist in the static/mentors folder
.PHONY: check-images
check-images:
	@echo "Checking images..."
	@jq -r '.[].img' $(JSON_FILE) | while read img; do \
		full_path="./static/mentors/$$img"; \
		if [ -f "$$full_path" ]; then \
			echo "Image $$full_path exists."; \
		else \
			echo "Image $$full_path is missing!"; \
			exit 1; \
		fi \
	done
