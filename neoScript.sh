#!/bin/bash

# Directory containing the images
IMAGE_DIR=~/Downloads/neoimages

# Randomly select an image
IMAGE=$(ls $IMAGE_DIR | shuf -n 1)

# Run Neofetch with the selected image
# neofetch --image $IMAGE_DIR/$IMAGE
neofetch --kitty $IMAGE_DIR/$IMAGE --size 200px --crop_mode fit --gap 3
