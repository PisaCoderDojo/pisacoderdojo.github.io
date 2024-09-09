
# Define the folder_ORIGINALS containing the original (coloured) images of the mentors
FOLDER_ORIGINALS = ./static/mentors/originals


# Target to convert the image to grayscale using ImageMagick https://imagemagick.org/script/download.php
.PHONY: grayscale
grayscale:
	IMAGES=$$(find ${FOLDER_ORIGINALS} -type f \( -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.png" \)); \
	for img in $$IMAGES; do \
		filename=$$(basename "$$img"); \
		echo "Processing image: $$img with name $$filename"; \
		magick "$$img" -colorspace Gray "./static/mentors/$$filename"; \
	done
