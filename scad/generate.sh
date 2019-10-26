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
generate_part cubes cube_basic
generate_part cubes cube_smooth
generate_part cubes cube_l
generate_part cubes cube_u
generate_part cubes cube_u_2holes
generate_part cubes cube_corner
generate_part cubes cube_s
generate_part cubes cube_1hole_open
generate_part cubes cube_2open
generate_part cubes cube_1hole
generate_part cubes cube_2hole
generate_part cubes prism_45deg
generate_part cubes prism_60deg
generate_part cubes cube_half
generate_part connectors connector_short
generate_part connectors connector_long
generate_part connectors peg
generate_part plates plate1x1
generate_part plates plate2x1
generate_part plates plate3x1
generate_part plates plate4x1
generate_part plates plate5x1
generate_part plates plate6x1
generate_part plates plate7x1
generate_part plates plate8x1
generate_part plates plate2x2
generate_part plates plate3x2
generate_part plates plate4x2
generate_part plates plate5x2
generate_part plates plate6x2
generate_part plates plate3x3
generate_part plates plate4x3
generate_part plates plate5x3
generate_part plates plate6x3
generate_part plates plate4x4
generate_part plates plate5x4
generate_part plates plate6x4
generate_part plates plate5x5
generate_part plates plate6x5
generate_part plates plate6x6
generate_part plates plate2x2_twosided
generate_part plates plate3x2_twosided
generate_part plates plate4x2_twosided
generate_part plates plate5x2_twosided
generate_part plates plate6x2_twosided
generate_part plates plate3x3_twosided
generate_part plates plate4x3_twosided
generate_part plates plate5x3_twosided
generate_part plates plate6x3_twosided
generate_part plates plate4x4_twosided
generate_part plates plate5x4_twosided
generate_part plates plate6x4_twosided
generate_part plates plate5x5_twosided
generate_part plates plate6x5_twosided
generate_part plates plate6x6_twosided
generate_part plates plate1x1_rounded
generate_part plates plate2x1_rounded
generate_part plates plate3x1_rounded
generate_part plates plate4x1_rounded
generate_part plates plate5x1_rounded
generate_part plates plate_peg
generate_part plates plate_1hole
generate_part plates plate_1hole_rounded
generate_part plates plate_2hole
generate_part plates plate_2hole_rounded
generate_part plates plate_2hole_inline
generate_part plates plate_2hole_rounded_inline
generate_part plates plate_2hole_rounded_inline_centered
generate_part plates plate_hinged
generate_part beams beam1
generate_part beams beam2
generate_part beams beam3
generate_part beams beam4
generate_part beams beam5
generate_part beams beam6
generate_part beams beam7
generate_part beams beam8
generate_part beams beam9
generate_part beams beam10
generate_part beams beam11
generate_part beams beam12
generate_part beams beam13
generate_part beams beam14
generate_part beams beam15
generate_part beams beam16
generate_part beams beam2_alternating
generate_part beams beam3_alternating
generate_part beams beam5_alternating
generate_part beams beam7_alternating
generate_part beams beam9_alternating
generate_part beams beam11_alternating
generate_part beams beam13_alternating
generate_part beams beam15_alternating
generate_part beams beam1_rounded
generate_part beams beam2_rounded
generate_part beams beam3_rounded
generate_part beams beam4_rounded
generate_part beams beam5_rounded
generate_part beams beam6_rounded
generate_part beams beam7_rounded
generate_part beams beam8_rounded
generate_part beams beam9_rounded
generate_part beams beam10_rounded
generate_part beams beam11_rounded
generate_part beams beam12_rounded
generate_part beams beam13_rounded
generate_part beams beam14_rounded
generate_part beams beam15_rounded
generate_part beams beam16_rounded
generate_part beams beam3_flat
generate_part beams beam4_flat
generate_part beams beam5_flat
generate_part beams beam6_flat
generate_part beams beam7_flat
generate_part beams beam8_flat
generate_part beams beam9_flat
generate_part beams beam10_flat
generate_part beams beam11_flat
generate_part beams beam12_flat
generate_part beams beam13_flat
generate_part beams beam14_flat
generate_part beams beam15_flat
generate_part beams beam16_flat
generate_part beams beam3_rounded_flat
generate_part beams beam4_rounded_flat
generate_part beams beam5_rounded_flat
generate_part beams beam6_rounded_flat
generate_part beams beam7_rounded_flat
generate_part beams beam8_rounded_flat
generate_part beams beam9_rounded_flat
generate_part beams beam10_rounded_flat
generate_part beams beam11_rounded_flat
generate_part beams beam12_rounded_flat
generate_part beams beam13_rounded_flat
generate_part beams beam14_rounded_flat
generate_part beams beam15_rounded_flat
generate_part beams beam16_rounded_flat
generate_part beams beam3_peg_pos1
generate_part beams beam3_peg_pos2
generate_part beams beam2_peg_pos2_alternating_semirounded
generate_part beams beam2_rounded_locked_pos1
generate_part beams beam3_rounded_locked_pos1
generate_part beams beam3_rounded_locked_pos2
generate_part beams beam5_rounded_locked_pos3
generate_part gears gear1
generate_part gears gear2
generate_part gears gear3
generate_part gears gear4
generate_part gears gear5
generate_part gears worm2
generate_part gears worm4
generate_part gears worm6
generate_part gears worm_block
generate_part gears bevel_gear_60deg
generate_part gears bevel_gear_90deg
generate_part gears bevel_gear_90deg_short
generate_part gears gear_rack4
generate_part gears gear_rack5
generate_part gears gear_rack6
generate_part gears gear_rack7
generate_part gears gear_rack8
generate_part gears gear_rack9
generate_part gears gear_rack10
generate_part gears gear_rack11
generate_part gears gear_rack12
generate_part gears gear_rack13
generate_part gears gear_rack14
generate_part gears gear_rack15
generate_part gears gear_rack16
generate_part wheels spoke_wheel2
generate_part wheels spoke_wheel3
generate_part wheels spoke_wheel4
generate_part wheels spoke_wheel2_rim
generate_part wheels spoke_wheel3_rim
generate_part wheels spoke_wheel4_rim
generate_part wheels spoke_wheel2_locked
generate_part wheels spoke_wheel3_locked
generate_part wheels spoke_wheel4_locked
generate_part wheels spoke_wheel2_rim_locked
generate_part wheels spoke_wheel3_rim_locked
generate_part wheels spoke_wheel4_rim_locked
generate_part axles axle2
generate_part axles axle3
generate_part axles axle4
generate_part axles axle5
generate_part axles axle6
generate_part axles axle7
generate_part axles axle8
generate_part axles axle9
generate_part axles axle10
generate_part axles axle11
generate_part axles axle12
generate_part axles axle13
generate_part axles axle14
generate_part axles axle15
generate_part axles axle16
generate_part axles axle_ring
generate_part axles cardan_joint
generate_part axles cardan_joint_thick
generate_part axles cardan_cube
generate_part steerings steering5
generate_part steerings steering6
generate_part steerings steering7
generate_part steerings steering8
generate_part steerings steering_column
generate_part icing seat
generate_part icing disk
