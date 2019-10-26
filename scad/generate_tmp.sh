#!/bin/bash
# kbricks construction system
# Script for generating stl files of all kbricks core parts
# Copyright 2019 Robert Kern

# Update location of OpenSCAD executable
OPENSCAD_EXECUTABLE=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

SCAD_SCRIPT=kbricks_core.scad
SCAD_SOURCE_DIR=.
STL_DIR=../stl
IMG_DIR=../img

# functions
function generate_part() {
    mkdir -p $IMG_DIR/$1
    mkdir -p $STL_DIR/$1
    README_FILE=$STL_DIR/$1/README.md
    if [ ! -f "$README_FILE" ]; then
        echo "## kbricks $1" > $README_FILE
        echo "" >> $README_FILE
        echo "STL file name | Image" >> $README_FILE
        echo "--------------|------" >> $README_FILE
    fi
    $OPENSCAD_EXECUTABLE -D"part=\"$2\"" -D"support=false" -o $IMG_DIR/$1/$2.png $SCAD_SOURCE_DIR/$SCAD_SCRIPT
    $OPENSCAD_EXECUTABLE --render -D"part=\"$2\"" -D"support=true" -o $STL_DIR/$1/$2.stl $SCAD_SOURCE_DIR/$SCAD_SCRIPT
    echo "$2.stl | ![$2](../$IMG_DIR/$1/$2.png)" >> $README_FILE
}

# generate parts
generate_part cubes cube_half
