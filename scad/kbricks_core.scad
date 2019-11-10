// kbricks construction system V1.0.0
// This file contains the CAD source of all kbricks core parts
// Copyright 2019 Robert Kern

// --------------------------------------------------------------------------------
// Dependencies
// --------------------------------------------------------------------------------
// Requires "Gears Library for OpenSCAD" by Dr. Joerg Janssen
// Download from https://www.thingiverse.com/thing:1604369/makes
use <lib/Getriebe.scad>

// --------------------------------------------------------------------------------
// Defaults
// --------------------------------------------------------------------------------
// Do not modify defaults because they are not yet used consistently
$fn = 100;
cube_size = 24;
connector_width = 4;
connector_tolerance = 0;
support_width = 0.2;
beam_tolerance = 0.1;
axle_diameter = cube_size/4;
axle_tolerance = 0.2;

// Generate parts
// part: name of a supported part
// support: set to true to generate embedded support where needed
export(part=part,support=support);

// --------------------------------------------------------------------------------
// External modules
// --------------------------------------------------------------------------------
module export(part="",support=false) {
    if (part!="") {
        if (part=="cube_basic") cube_basic(support=support);
        if (part=="cube_smooth") cube_smooth(support=support);
        if (part=="cube_l") cube_l(support=support);
        if (part=="cube_corner") cube_corner(support=support);
        if (part=="cube_half") cube_half();
        if (part=="cube_s") cube_s(support=support);
        if (part=="cube_u") cube_u(support=support);
        if (part=="cube_u_2holes") cube_u_2holes(support=support);
        if (part=="cube_1hole_open") cube_holes(number_holes=1,open=true,support=support);
        if (part=="cube_2open") cube_2open(support=support);
        if (part=="cube_1hole") cube_holes(number_holes=1,support=support);
        if (part=="cube_2hole") cube_holes(number_holes=2,support=support);
        if (part=="seat") seat(support=support);
        if (part=="disk") disk();
        if (part=="figure_body") figure_body();
        if (part=="figure_body_short") figure_body(length = 3*cube_size/4);
        if (part=="figure_waist") figure_waist();
        if (part=="figure_leg") figure_leg();
        if (part=="figure_leg_short") figure_leg(length = 3*cube_size/4);
        if (part=="figure_arm") figure_arm();
        if (part=="figure_arm_short") figure_arm(length = 3*cube_size/4);
        if (part=="figure_head") figure_head();
        if (part=="figure_hand") figure_hand();
        if (part=="figure_cap") figure_cap();
        if (part=="figure_hair") figure_cap(shield_length = 0);

        if (part=="connector_short") connector(length=6);
        if (part=="connector_long") connector(length=16);
        if (part=="peg") peg();

        if (part=="plate1x1") plate(length=1,width=1);
        if (part=="plate2x1") plate(length=2,width=1);
        if (part=="plate3x1") plate(length=3,width=1);
        if (part=="plate4x1") plate(length=4,width=1);
        if (part=="plate5x1") plate(length=5,width=1);
        if (part=="plate6x1") plate(length=6,width=1);
        if (part=="plate7x1") plate(length=7,width=1);
        if (part=="plate8x1") plate(length=8,width=1);
        if (part=="plate2x2") plate(length=2,width=2);
        if (part=="plate3x2") plate(length=3,width=2);
        if (part=="plate4x2") plate(length=4,width=2);
        if (part=="plate5x2") plate(length=5,width=2);
        if (part=="plate6x2") plate(length=6,width=2);
        if (part=="plate3x3") plate(length=3,width=3);
        if (part=="plate4x3") plate(length=4,width=3);
        if (part=="plate5x3") plate(length=5,width=3);
        if (part=="plate6x3") plate(length=6,width=3);
        if (part=="plate4x4") plate(length=4,width=4);
        if (part=="plate5x4") plate(length=5,width=4);
        if (part=="plate6x4") plate(length=6,width=4);
        if (part=="plate5x5") plate(length=5,width=5);
        if (part=="plate6x5") plate(length=6,width=5);
        if (part=="plate6x6") plate(length=6,width=6);
        if (part=="plate2x2_twosided") plate_twosided(length=2,width=2);
        if (part=="plate3x2_twosided") plate_twosided(length=3,width=2);
        if (part=="plate4x2_twosided") plate_twosided(length=4,width=2);
        if (part=="plate5x2_twosided") plate_twosided(length=5,width=2);
        if (part=="plate6x2_twosided") plate_twosided(length=6,width=2);
        if (part=="plate3x3_twosided") plate_twosided(length=3,width=3);
        if (part=="plate4x3_twosided") plate_twosided(length=4,width=3);
        if (part=="plate5x3_twosided") plate_twosided(length=5,width=3);
        if (part=="plate6x3_twosided") plate_twosided(length=6,width=3);
        if (part=="plate4x4_twosided") plate_twosided(length=4,width=4);
        if (part=="plate5x4_twosided") plate_twosided(length=5,width=4);
        if (part=="plate6x4_twosided") plate_twosided(length=6,width=4);
        if (part=="plate5x5_twosided") plate_twosided(length=5,width=5);
        if (part=="plate6x5_twosided") plate_twosided(length=6,width=5);
        if (part=="plate6x6_twosided") plate_twosided(length=6,width=6);
        if (part=="plate1x1_rounded") plate(length=1,width=1,rounded=true);
        if (part=="plate2x1_rounded") plate(length=2,width=1,rounded=true);
        if (part=="plate3x1_rounded") plate(length=3,width=1,rounded=true);
        if (part=="plate4x1_rounded") plate(length=4,width=1,rounded=true);
        if (part=="plate5x1_rounded") plate(length=5,width=1,rounded=true);

        if (part=="plate_peg") plate_peg();
        if (part=="plate_1hole") plate_holes(number_holes=1);
        if (part=="plate_1hole_rounded") plate_holes(number_holes=1,rounded=true);
        if (part=="plate_2hole") plate_holes(number_holes=2);
        if (part=="plate_2hole_rounded") plate_holes(number_holes=2,rounded=true);
        if (part=="plate_2hole_inline") plate_holes(number_holes=2,inline=true);
        if (part=="plate_2hole_rounded_inline") plate_holes(number_holes=2,rounded=true,inline=true);
        if (part=="plate_2hole_rounded_inline_centered") plate_holes(number_holes=2,rounded=true,inline=true,centered=true);
        if (part=="plate_hinged") plate_holes(hinged=true);

        if (part == "beam1") beam(number_holes=1,tolerance=0);
        if (part == "beam2") beam(number_holes=2,tolerance=0);
        if (part == "beam3") beam(number_holes=3,tolerance=0);
        if (part == "beam4") beam(number_holes=4,tolerance=0);
        if (part == "beam5") beam(number_holes=5,tolerance=0);
        if (part == "beam6") beam(number_holes=6,tolerance=0);
        if (part == "beam7") beam(number_holes=7,tolerance=0);
        if (part == "beam8") beam(number_holes=8,tolerance=0);
        if (part == "beam9") beam(number_holes=9,tolerance=0);
        if (part == "beam10") beam(number_holes=10,tolerance=0);
        if (part == "beam11") beam(number_holes=11,tolerance=0);
        if (part == "beam12") beam(number_holes=12,tolerance=0);
        if (part == "beam13") beam(number_holes=13,tolerance=0);
        if (part == "beam14") beam(number_holes=14,tolerance=0);
        if (part == "beam15") beam(number_holes=15,tolerance=0);
        if (part == "beam16") beam(number_holes=16,tolerance=0);
 
        if (part == "beam3_flat") beam(number_holes=3,flat=true,tolerance=0);
        if (part == "beam4_flat") beam(number_holes=4,flat=true,tolerance=0);
        if (part == "beam5_flat") beam(number_holes=5,flat=true,tolerance=0);
        if (part == "beam6_flat") beam(number_holes=6,flat=true,tolerance=0);
        if (part == "beam7_flat") beam(number_holes=7,flat=true,tolerance=0);
        if (part == "beam8_flat") beam(number_holes=8,flat=true,tolerance=0);
        if (part == "beam9_flat") beam(number_holes=9,flat=true,tolerance=0);
        if (part == "beam10_flat") beam(number_holes=10,flat=true,tolerance=0);
        if (part == "beam11_flat") beam(number_holes=11,flat=true,tolerance=0);
        if (part == "beam12_flat") beam(number_holes=12,flat=true,tolerance=0);
        if (part == "beam13_flat") beam(number_holes=13,flat=true,tolerance=0);
        if (part == "beam14_flat") beam(number_holes=14,flat=true,tolerance=0);
        if (part == "beam15_flat") beam(number_holes=15,flat=true,tolerance=0);
        if (part == "beam16_flat") beam(number_holes=16,flat=true,tolerance=0);

        if (part == "beam2_alternating") beam(number_holes=2,alternating=true,tolerance=0);
        if (part == "beam3_alternating") beam(number_holes=3,alternating=true,tolerance=0);
        if (part == "beam5_alternating") beam(number_holes=5,alternating=true,tolerance=0);
        if (part == "beam7_alternating") beam(number_holes=7,alternating=true,tolerance=0);
        if (part == "beam9_alternating") beam(number_holes=9,alternating=true,tolerance=0);
        if (part == "beam11_alternating") beam(number_holes=11,alternating=true,tolerance=0);
        if (part == "beam13_alternating") beam(number_holes=13,alternating=true,tolerance=0);
        if (part == "beam15_alternating") beam(number_holes=15,alternating=true,tolerance=0);
        if (part == "beam1_rounded") beam(number_holes=1,rounded=true);
        if (part == "beam2_rounded") beam(number_holes=2,rounded=true);
        if (part == "beam3_rounded") beam(number_holes=3,rounded=true);
        if (part == "beam4_rounded") beam(number_holes=4,rounded=true);
        if (part == "beam5_rounded") beam(number_holes=5,rounded=true);
        if (part == "beam6_rounded") beam(number_holes=6,rounded=true);
        if (part == "beam7_rounded") beam(number_holes=7,rounded=true);
        if (part == "beam8_rounded") beam(number_holes=8,rounded=true);
        if (part == "beam9_rounded") beam(number_holes=9,rounded=true);
        if (part == "beam10_rounded") beam(number_holes=10,rounded=true);
        if (part == "beam11_rounded") beam(number_holes=11,rounded=true);
        if (part == "beam12_rounded") beam(number_holes=12,rounded=true);
        if (part == "beam13_rounded") beam(number_holes=13,rounded=true);
        if (part == "beam14_rounded") beam(number_holes=14,rounded=true);
        if (part == "beam15_rounded") beam(number_holes=15,rounded=true);
        if (part == "beam16_rounded") beam(number_holes=16,rounded=true);

        if (part == "beam3_rounded_flat") beam(number_holes=3,rounded=true,flat=true);
        if (part == "beam4_rounded_flat") beam(number_holes=4,rounded=true,flat=true);
        if (part == "beam5_rounded_flat") beam(number_holes=5,rounded=true,flat=true);
        if (part == "beam6_rounded_flat") beam(number_holes=6,rounded=true,flat=true);
        if (part == "beam7_rounded_flat") beam(number_holes=7,rounded=true,flat=true);
        if (part == "beam8_rounded_flat") beam(number_holes=8,rounded=true,flat=true);
        if (part == "beam9_rounded_flat") beam(number_holes=9,rounded=true,flat=true);
        if (part == "beam10_rounded_flat") beam(number_holes=10,rounded=true,flat=true);
        if (part == "beam11_rounded_flat") beam(number_holes=11,rounded=true,flat=true);
        if (part == "beam12_rounded_flat") beam(number_holes=12,rounded=true,flat=true);
        if (part == "beam13_rounded_flat") beam(number_holes=13,rounded=true,flat=true);
        if (part == "beam14_rounded_flat") beam(number_holes=14,rounded=true,flat=true);
        if (part == "beam15_rounded_flat") beam(number_holes=15,rounded=true,flat=true);
        if (part == "beam16_rounded_flat") beam(number_holes=16,rounded=true,flat=true);

        if (part == "beam3_peg_pos1") beam_with_peg(number_holes=3,position=1);
        if (part == "beam3_peg_pos2") beam_with_peg(number_holes=3,position=2);
        if (part == "beam2_peg_pos2_alternating_semirounded") beam_with_peg(number_holes=2,position=2,alternating=true,semirounded=true);

        if (part == "beam2_rounded_locked_pos1") beam(number_holes=2,rounded=true,locked=1);
        if (part == "beam3_rounded_locked_pos1") beam(number_holes=3,rounded=true,locked=1);
        if (part == "beam3_rounded_locked_pos2") beam(number_holes=3,rounded=true,locked=2);
        if (part == "beam5_rounded_locked_pos3") beam(number_holes=5,rounded=true,locked=3);

        if (part == "prism_45deg") prism_45deg();
        if (part == "prism_60deg") prism_60deg();
        if (part == "gear1") gear(number_cogs=12);
        if (part == "gear2") gear(number_cogs=24);
        if (part == "gear3") gear(number_cogs=36);
        if (part == "gear4") gear(number_cogs=48);
        if (part == "gear5") gear(number_cogs=60);
        if (part == "worm2") worm(length=2);
        if (part == "worm4") worm(length=4);
        if (part == "worm6") worm(length=6);
        if (part == "worm_block") worm_block();
        if (part == "bevel_gear_60deg") bevel_gear_60deg();
        if (part == "bevel_gear_90deg") bevel_gear_90deg();
        if (part == "bevel_gear_90deg_short") bevel_gear_90deg_short();

        if (part == "gear_rack4") gear_rack(number_holes=4);
        if (part == "gear_rack5") gear_rack(number_holes=5);
        if (part == "gear_rack6") gear_rack(number_holes=6);
        if (part == "gear_rack7") gear_rack(number_holes=7);
        if (part == "gear_rack8") gear_rack(number_holes=8);
        if (part == "gear_rack9") gear_rack(number_holes=9);
        if (part == "gear_rack10") gear_rack(number_holes=10);
        if (part == "gear_rack11") gear_rack(number_holes=11);
        if (part == "gear_rack12") gear_rack(number_holes=12);
        if (part == "gear_rack13") gear_rack(number_holes=13);
        if (part == "gear_rack14") gear_rack(number_holes=14);
        if (part == "gear_rack15") gear_rack(number_holes=15);
        if (part == "gear_rack16") gear_rack(number_holes=16);

        if (part == "spoke_wheel2") spoke_wheel(size=2);
        if (part == "spoke_wheel3") spoke_wheel(size=3);
        if (part == "spoke_wheel4") spoke_wheel(size=4);
        if (part == "spoke_wheel2_rim") spoke_wheel(size=2,rim=true);
        if (part == "spoke_wheel3_rim") spoke_wheel(size=3,rim=true);
        if (part == "spoke_wheel4_rim") spoke_wheel(size=4,rim=true);
        if (part == "spoke_wheel2_locked") spoke_wheel(size=2,locked=true);
        if (part == "spoke_wheel3_locked") spoke_wheel(size=3,locked=true);
        if (part == "spoke_wheel4_locked") spoke_wheel(size=4,locked=true);
        if (part == "spoke_wheel2_rim_locked") spoke_wheel(size=2,rim=true,locked=true);
        if (part == "spoke_wheel3_rim_locked") spoke_wheel(size=3,rim=true,locked=true);
        if (part == "spoke_wheel4_rim_locked") spoke_wheel(size=4,rim=true,locked=true);

        if (part == "axle2") axle(length=2);
        if (part == "axle3") axle(length=3);
        if (part == "axle4") axle(length=4);
        if (part == "axle5") axle(length=5);
        if (part == "axle6") axle(length=6);
        if (part == "axle7") axle(length=7);
        if (part == "axle8") axle(length=8);
        if (part == "axle9") axle(length=9);
        if (part == "axle10") axle(length=10);
        if (part == "axle11") axle(length=11);
        if (part == "axle12") axle(length=12);
        if (part == "axle13") axle(length=13);
        if (part == "axle14") axle(length=14);
        if (part == "axle15") axle(length=15);
        if (part == "axle16") axle(length=16);

        if (part == "axle_ring") axle_ring();
        if (part == "cardan_joint") cardan_joint();
        if (part == "cardan_joint_thick") cardan_joint(thick=true);
        if (part == "cardan_cube") cardan_cube();
        if (part == "steering5") steering(number_holes=5);
        if (part == "steering6") steering(number_holes=6);
        if (part == "steering7") steering(number_holes=7);
        if (part == "steering8") steering(number_holes=8);
        if (part == "steering_column") steering_column();
   }
}

module figure_body(length = cube_size) {
    c = cube_size - 2*beam_tolerance;
    union() {
        difference() {
            cube([c, cube_size/2, length], center=true);
            for (i=[-1:2:1]) {
                translate([-i*cube_size/4, 0, length/2 - cube_size/4])
                rotate([0, 90, 0])
                peg_female();
            }
            angles = [ [270,0,0],[270,0,90]];
            for (w = angles) {
                slot(angle1=w, cubes=false, distance = length/2);
            }
        }
        translate([0, 0, length/2 - beam_tolerance])
        peg_half();
    }
}

module figure_waist() {
    c = cube_size - 2*beam_tolerance;
    union() {
        difference() {
            cube([c, cube_size/2, cube_size/4], center=true);
            angles = [ [270,0,0],[270,0,90]];
            translate([0, 0, 3*cube_size/8])
            for (w = angles) {
                slot(angle1=w, cubes=false);
            }
        }
        translate([0, 0, 3*cube_size/8])
        difference() {
            r = 4*cube_size/24 + axle_tolerance/2;
            cube([cube_size/8, cube_size/2, cube_size/2 - 2*beam_tolerance], center=true);
            rotate([0, 90, 0])
            cylinder(cube_size/4, r, r, center=true);
        }
    }
}

module figure_leg(length = cube_size) {
    leg_dist = cube_size/8;
    difference() {
        union(){
            s = cube_size/2 - 2*beam_tolerance;
            h = cube_size/2 - 2*beam_tolerance - leg_dist/2;
            translate([0, 0, 0])
            hull() {
                cylinder(h, s/2, s/2, center=true);
                translate([-(length-cube_size/2), 0, 0])
                cube([cube_size/2, s, h], center=true);
            }
            translate([-(length - cube_size/8), -s/4, 0])
            cube([cube_size/4, 3*s/2, h], center=true);
        }
        for (i = [-1:2:1])
            translate([0 ,0, i*(leg_dist/4-3*beam_tolerance)])
            peg_female();
        slot(angle1=90, distance=length);
        translate([-length + cube_size/2, 0, 0])
        slot(angle1=[0, 0, 0], distance=cube_size/4);
    }
}

module figure_arm(length = cube_size) {
    leg_dist = cube_size/8;
    s = cube_size/2 - 2*beam_tolerance;
    h = cube_size/2 - 2*beam_tolerance - leg_dist/2;
    difference() {
        union() {
            translate([0, 0, 0])
            scale([1, 1, h/s])
            hull() {
                translate([(length - cube_size/2)/2, 0, 0])
                union() {
                    translate([0 ,0, s/4])
                    cylinder(s/2, s/2, s/2, center=true);
                    intersection() {
                        translate([0 ,0, -s/4])
                        cylinder(s/2, s/2, s/2, center=true);
                        rotate([0, 90, 90])
                        cylinder(s, s/2, s/2, center=true);
                    }
                }
                translate([-(length - cube_size/2)/2, 0, 0])
                cube(s, center=true);
            }
            translate([(length - cube_size/2)/2, 0, h/2-3*beam_tolerance])
            peg_half();
        }
        translate([-(length - cube_size/2)/2 ,0, 0])
        rotate([0, 90, 0])
        peg_female();
    }
}

module figure_head(width = 20*cube_size/24, neck_length = 2*cube_size/24) {
    neck_width = 11*cube_size/24;
    difference() {
        union() {
            minkowski() {
                cube(width-cube_size/2, center=true);
                sphere(cube_size/4);
            }
            translate([0, 0, width/2])
            cylinder(2*neck_length, neck_width/2, neck_width/2, center=true);
        }
        translate([0, 0, -3*width/4])
        cube([width, width, width], center=true);
        translate([0, 0,  cube_size/2 - width/4])
        slot(angle1=[270,0,0], cubes=false);
        translate([-cube_size/2, 0,  cube_size/2 - width/4])
        slot(angle1=[270,0,90], cubes=false);
        translate([width/2, 0, width/2/2.5])
        cube([cube_size/6, cube_size/6, cube_size/12], center=true);
        for (i=[-1:2:1])
            translate([width/2, i*width/6, -width/12])
            rotate([0, 90, 0])
            cylinder(cube_size/6, 1.5, 1.5, center=true);
        translate([0, 0, - cube_size/4 + width/2 + neck_length])
        peg_female();
    }
}

module figure_cap(width = 20*cube_size/24, shield_length = cube_size/8) {
    difference() {
        translate([shield_length/2, 0, -cube_size/4])
        minkowski() {
            cube([width -cube_size/2 + shield_length, width - cube_size/2, cube_size/2], center=true);
            sphere(cube_size/4);
        }
        translate([0, 0, -cube_size])
        cube(cube_size*2, center=true);
        slot(angle1=[270,0,0], cubes=false, distance=0);
        translate([-cube_size/2, 0, 0])
        slot(angle1=[270,0,90], cubes=false, distance=0);
    }
}

module figure_hand() {
    r1 = 4.5*cube_size/24;
    r2 = axle_diameter/2 + axle_tolerance/2;
    difference() {
        union() {
            rotate([180, 0, 0])
            peg_half();
            translate([0, 0, cube_size/4])
            rotate([90, 0, 0])
            cylinder(cube_size/3, r1, r1, center=true);
            translate([0, 0, cube_size/12])
            cylinder(cube_size/6, cube_size/6, cube_size/6, center=true);
        }
        translate([0, 0, cube_size/4])
        rotate([90, 0, 0])
        cylinder(cube_size/2, r2, r2, center=true);
        translate([0, 0, 10.5*cube_size/24])
        scale(0.95)
        slot(angle1=[270,180,0], distance = 0);
    }
}

module spoke_wheel(size=3,rim=false,locked=false) {
    rim_depth = rim?0.5:0;
    if (size==4)
        spoke_wheel_impl(outer_radius=cube_size,inner_radius=cube_size/24*20,width=cube_size/12*5,rounding_radius=cube_size/24,number_spokes=16,spoke_height=cube_size/24*5,rim_depth=rim_depth,locked=locked);
    else if (size==2.5)
        spoke_wheel_impl(outer_radius=cube_size/24*21,inner_radius=cube_size/24*17,width=cube_size/12*5,rounding_radius=cube_size/24,number_spokes=16,spoke_height=cube_size/24*5,rim_depth=rim_depth,locked=locked);
    else if (size==3)
        spoke_wheel_impl(outer_radius=cube_size/24*18,inner_radius=cube_size/24*14,width=cube_size/3,rounding_radius=cube_size/24,number_spokes=12,spoke_height=cube_size/6,rim_depth=rim_depth,locked=locked);
    else if (size==2.5)
        spoke_wheel_impl(outer_radius=cube_size/24*15,inner_radius=cube_size/24*12,width=cube_size/3,rounding_radius=cube_size/24,number_spokes=12,spoke_height=cube_size/6,rim_depth=rim_depth,locked=locked);
    else if (size==2)
        spoke_wheel_impl(outer_radius=cube_size/24*12,inner_radius=cube_size/24*9,width=cube_size/3,rounding_radius=cube_size/24,number_spokes=8,spoke_height=cube_size/6,rim_depth=rim_depth,locked=locked);
}

module plate_holes(number_holes=2,rounded=false,inline=false,centered=false, hinged=false) {
    assert (number_holes>=1 && number_holes<=2);
    if (hinged) {
        rotate([0, 180, 0])
        union() {
            plate(length=1,width=1,rounded=false);
            u = cube_size/8*sqrt(2);
            translate([0, cube_size/8*5, 0])
            rotate([45, 0, 0])
            prism(length=24,width=2*u,height=u);
            for (i=[-1:2:1]) {
                translate([i*cube_size/4, cube_size/4*3, -cube_size/8])
                rotate([0, 90, 0])
                beam(1,rounded=true,tolerance=0);
            }
        }
    } else if (number_holes==1 && rounded) {
        union() {
            translate([6,0,-9])
            plate(1,1);
            female_connector();
        }
    } else {
        union() {
            plate(length=1,width=1,rounded=false);
            for(i = [0:number_holes-1]) {
                x_pos = number_holes==1 ? 0 : (i*number_holes-1)*cube_size/4;
                translate([x_pos,centered?0:cube_size/4,cube_size/8])
                rotate([0,90,inline?90:0])
                rotate([90,0,0])
                difference() {
                    beam(2,rounded=rounded,tolerance=0);
                    translate([cube_size/2,0,0])
                    cube(cube_size,center=true);
                }
            }
        }
    }
}

module cube_u(support=false) {
    difference() {
        union() {
            difference() {
                cube(cube_size, center=true);
                angles = [ [0,0,0], [0,0,90], [0,0,180],
                  [0,0,270],[0,90,0], [0,90,90],
                  [0,90,180],[0,90,270],[270,0,0],[270,0,90],[90,0,90] ];
                for ( w = angles) {
                    slot(angle1 = w);
                }
            }
            if (support)
                cube_support();
        }
        translate([0,0,cube_size/4])
        cube([cube_size/2,cube_size+2,cube_size], center=true);
    }
}

module cube_u_2holes() {
    difference() {
        cube(cube_size, center=true);
        angles = [ [90, 180, 0],[90, 180, 90] ];
        for ( w = angles) {
            slot(angle1 = w);
        }
        p = cube_size / 4;
        translate([0, 0, p]) {
            cube([2*cube_size, cube_size/2, cube_size], center=true);
        }
        translate([0, -cube_size/4, cube_size/4])
        rotate([90, 0, 0])
        peg_female();
        translate([0, cube_size/4, cube_size/4])
        rotate([90, 0, 0])
        peg_female();
    }
}

module cardan_joint(thick=false) {
    union() {
        difference() {
            translate([0,0,4.5])
            if (thick) {
                r = cube_size / 4 - axle_tolerance;
                cylinder(16,r,r,center=true);
            } else {
                cylinder(16,5,5,center=true);
            }
            translate([0,0,6])
            cylinder(8,3,3);
            difference() {
                peg_female();
                translate([0,0,3])
                connector_lock(14);
            }
            translate([0,0,14])
            cube([6.2,16,16],center=true);
            for(i=[-1:2:1])
                translate([0,10*i,14])
                cube([16,16,16],center=true);
        }
        translate([3.1,0,11])
        sphere(1.5,center=true);
        translate([-3.1,0,11])
        sphere(1.5,center=true);
    }
}

module cardan_cube() {
    difference() {
        cube(4.6,center=true);
        for(i=[0:3])
            rotate([0,0,90*i])
            translate([3.1,0,0])
            sphere(1.5,center=true);
    }
}

module axle_ring() {
    outer_radius = 3.5;
    heigth = 2.8;
    slope = 0.5;
    difference() {
        union() {
            cylinder(heigth,outer_radius,outer_radius,center=true);
            translate([0,0,heigth/2])
            cylinder(slope,outer_radius,3);
            translate([0,0,-heigth/2-slope])
            cylinder(slope,3,outer_radius);
        }
        cylinder(6,2.5,2.5, center=true);
        translate([3,0,0])
        cube([4,4,6],center=true);
    }
}

module axle(length=4) {
    l = length/2-1;
    intersection() {
        difference() {
            union() {
                rotate([90,0,0])
                cylinder((length-2)*12,3,3,center=true);
                for(i=[-1:2:1])
                    translate([0,12*l*i,0])
                    rotate([-90*i,0,0])
                    rotate([0,0,90])
                    peg_half();
            }
            for(i=[-l:l])
                translate([0,12*i,0])
                rotate([90,0,0])
                difference() {
                    cylinder(4,5,5,center=true);
                    cylinder(4,2.5,2.5,center=true);
                }
        }
        cube([10,length*12,5],center=true);
    }
}

module bevel_gear_60deg() {
    union() {
        for(i=[0,1])
        translate([27.9*i,0,4])
        connector_lock(length_mm = 8);
        kegelradpaar(modul=1, zahnzahl_rad=20, zahnzahl_ritzel=20, achsenwinkel=60, zahnbreite=9, bohrung_rad=6.1, bohrung_ritzel=6.1, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=false);
    }
} 

module bevel_gear_90deg() {
    r = cube_size / 4 - axle_tolerance;
    distance = 22.67;
    rotate([180,0,0])
    for (i=[0:1])
        union() {
            difference() {
                kegelradpaar(modul=1.7, zahnzahl_rad=10, zahnzahl_ritzel=10, achsenwinkel=90, zahnbreite=8, bohrung_rad=0, bohrung_ritzel=0, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=false);
                translate([0,0,8])
                cylinder(6,12,12,center=true);
                translate([distance,0,8])
                cylinder(6,12,12,center=true);
            }
            translate([distance*i,0,-5.9])
            difference() {
                cylinder(12.2, r, r, center=true);
                translate([0,0,-2])
                peg_female();
            }
            translate([distance*i,0,-8])        
            connector_lock(length_mm = 8);
        }
} 

module bevel_gear_90deg_short() {
    distance = 22.67;
    union() {
        difference() {
            union() {
                kegelradpaar(modul=1.7, zahnzahl_rad=10, zahnzahl_ritzel=10, achsenwinkel=90, zahnbreite=8, bohrung_rad=0, bohrung_ritzel=0, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=false);
                translate([0,0,4])        
                cylinder(8,4,4,center=true);
                translate([distance,0,4])        
                cylinder(8,4,4,center=true);
            }
            translate([0,0,4])        
            cylinder(10,3,3,center=true);
            translate([distance,0,4])        
            cylinder(10,3,3,center=true);
        }
        translate([0,0,4])        
        connector_lock(length_mm = 8);
        translate([distance,0,4])        
        connector_lock(length_mm = 8);
    }
} 

module steering_column() {
    union() {
        difference() {
            union() {
                difference() {
                    cube(24, center=true);
                    translate([0,-6,6])
                    cube([12,24,24], center=true);
                }
                translate([0,12,12])
                rotate([45,0,0])
                translate([0,-6,12])
                rotate([0,0,90])
                union() {
                    female_connector();
                    translate([0,0,-9])
                    cube([12,24,6],center=true);
                }
            }
            angles = [ [0,0,0], [0,0,90],
              [0,0,270],[0,90,0], [0,90,90],
              [0,90,270],[270,0,0],[270,0,90] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
        }
        difference() {
            cube([24, 24, 4.2], center=true);
            translate([0,-0.2,0])
            cube([23.6, 24, 5], center=true);
        }
    }
}

module steering(number_holes=5) {
    union() {
        rotate([90,0,0])
        difference() {
            union() {
                cube(24, center=true);
                translate([0,0,0]) // z: -cube_size/4
                rotate([90,0,0])
                beam_with_outer_connectors(number_holes,hight=12,rounded=true); // add tolerance=0
            }
            angles = [ [0,0,0],[0,90,180],[0,0,180],[0,90,0] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
            translate([0,0,6])
            peg_female();
            translate([0,0,-6])
            peg_female();
        }
    }
}

module gear_rack(number_holes=5,rounded=true) {
    rack_length = number_holes*cube_size/2;
    actual_rack_length = rack_length-1.5*cube_size+3;
    tilt_angle=[90,0,0];
    union() {
        difference() {
            translate([0,-0,-5.9])
            beam_with_outer_connectors(number_holes,rounded=rounded);
            cube([actual_rack_length,cube_size,cube_size],center=true);
        }
        intersection() {
            cube([actual_rack_length,cube_size,cube_size], center=true);
            rotate(tilt_angle)
            translate([0,0,-5.9])
            zahnstange(modul=1, laenge=rack_length, hoehe=5.9,
 breite=11.8, eingriffswinkel=20, schraegungswinkel=0);
        }
    }
}

module gear(number_cogs=24) {
    union() {
        translate([0,0,-4])
        stirnrad(modul=1, zahnzahl=number_cogs, breite=8, bohrung=6.1,eingriffswinkel=20, schraegungswinkel=0, optimiert=true);
        connector_lock(cube_size/3);
    }
}


module worm(length=2, angle=10) {
    union() {
        b = axle_diameter + axle_tolerance;
        l = length*cube_size/2 - cube_size/8;
        difference() {
            schnecke(modul=1, gangzahl=2, laenge=l, bohrung=b,
            eingriffswinkel=20, steigungswinkel=angle, zusammen_gebaut=true);
            translate([0, 0, cube_size/6])
            peg_female();
            translate([0, 0, l-cube_size/6])
            peg_female();
        }
        translate([0,0,4])
        connector_lock(cube_size/3);
        translate([0, 0, l-cube_size/6])
        connector_lock(cube_size/3);
    }
}

module worm_block() {
    rotate([90, 0, 0])
    difference() {
        s = cube_size - 2*beam_tolerance;
        cube([2*s, s/2, s], center=true);
        for(x = [-1:2:1]) {
            translate([x*cube_size/4*3, 0, cube_size/4])
            rotate([90, 0, 90])
            peg_female();
            translate([x*cube_size/4*3, 0, -cube_size/4])
            peg_female();
        }
        translate([0, cube_size/4, 0])
        rotate([90, 0, 0])
        worm(length=cube_size/2, angle=8.8);
        rotate([90, 0, 0])
        cylinder(2*cube_size, cube_size/24*5, cube_size/24*5, center=true);
    }
}

module cube_l(support=false) {
    union() {
        difference() {
            cube(24, center=true);
            angles = [ [180,0,180],[180,90,180],
            [90,180,0],[90,180,90] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
            translate([0, -6, 6]) {
                cube([26, 24, 24], center=true);
            }
        }
        translate([0, 9.5, 0]) {
            difference() {
                cube([24, 5, 4.2], center=true);
                cube([23.6, 4.6, 5], center=true);
            }
        }
    }
}

module cube_corner(support=false) {
    union() {
        difference() {
            cube(cube_size, center=true);
            angles = [ [180, 0, 180],[180, 90, 180],
            [90, 180, 0],[90, 180, 90],[180, 0, 270],[180, 90, 270] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
            p = cube_size / 4;
            translate([p, -p, p]) {
                cube([cube_size, cube_size, cube_size], center=true);
            }
        }
        if (support) {
            angles = [ [0.0, 90, 0], [180, 90, 270] ];
            for ( w = angles) {
                slot_support(angle = w);
            }
        }
    }
}

module cube_half() {
    union() {
        for (i=[0:1]) {
            rotate([i*180, 0, 0])
            translate([0, 0, -cube_size/8])
            plate(length=1,width=1);
        }
    }
}

module cube_s(support=false) {
    union() {
        difference() {
            cube(cube_size, center=true);
            angles = [ [180, 0, 180],[180, 90, 180],
            [90, 180, 0],[90, 180, 90],[180, 0, 270],[180, 90, 270],
            [180, 0, 0],[180, 90, 0] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
            p = cube_size / 4;
            translate([p, 0, p]) {
                cube([cube_size, cube_size/2, cube_size], center=true);
            }
        }
        if (support) {
            angles = [ [0, 90, 0], [180, 90, 270], [90, 90, 270] ];
            for ( w = angles) {
                slot_support(angle = w);
            }
        }
    }
}

module prism_45deg() {
    difference() {
        rotate([-135,0,0])
        difference() {
            rotate([135,0,0])
            prism(24,24*sqrt(2),24/2*sqrt(2));
            angles = [ [0,0,180],[0,90,180],[270,0,180],[270,0,90]];
            for ( w = angles) {
                slot(angle1 = w);
            }
        }
        scale([1,2,1])
        slot(angle1=[270,0,0],distance=0);
    }
}

module prism_60deg() {
    difference() {
        l = 12; // half cube size
        r = (pow(3,0.5)*l/3); // inner radius
        points = [ [-l,-l,-r],[-l,l,-r],
            [l,l,-r],[l,-l,-r],
            [-l,0,2*r],[l,0,2*r]];
        faces = [[0,3,2,1],[0,1,4],[3,5,2],
            [0,4,5,3],[2,5,4,1]];
        polyhedron(points, faces);
        angles = [[30,0,0],[150,0,0]];
        for ( w = angles) {
            slot(angle1=w,distance=r);
        }
        for ( w = angles) {
            slot(angle1=w,angle2=[0,90,0],distance=r);
        }
    }
}

module plate_peg() {
    union() {
        plate(1,1);
        translate([0,0,3])
        peg_half();
    }
}

module beam_with_peg(number_holes=3,alternating=false,position=1,rounded=true,semirounded=false,tolerance=beam_tolerance) {
    rotate([270,0,0]) {
        beam(number_holes,alternating=alternating,rounded=rounded,semirounded=semirounded,tolerance=tolerance);
        rotate([90,90,0])
        translate([0,6*(number_holes+1)-12*position,6])
        peg_half();
    }
}

module beam(number_holes=5,alternating=false,flat=false,rounded=false,tolerance=beam_tolerance,semirounded=false,locked=-1) {
    if (flat)
        beam_with_outer_connectors(number_holes=number_holes,hight=5.9,rounded=rounded,tolerance=tolerance);
    else {
        dist=(number_holes-1)*6;
        difference() {
            union(){
                s = cube_size/2-2*tolerance;
                hull() {
                    translate([-dist,0,0])
                    if (rounded || semirounded)
                        cylinder(s,s/2,s/2,center=true);
                    else
                        cube(s, center=true);
                    translate([dist,0,0])
                    if (rounded || semirounded)
                        cylinder(s,s/2,s/2,center=true);
                    else
                        cube(s, center=true);
                }
                if (semirounded) {
                    translate([-dist,0,0])
                    cube(s, center=true);
                }
            }
            for(i = [0:number_holes]) {
                x_angle = (alternating && i%2==1) ? 90 : 0;
                translate([-dist+12*i,0,0]) {
                    rotate([x_angle,0,0])
                    if (locked == i+1) {
                        peg_female_with_lock();
                    } else {
                        peg_female();
                    }
                }
            }
        }
    }
}


module peg() {
    peg_half();
    rotate([180,0,0])
    peg_half();
}

module plate(length=1,width=1,rounded=false) {
    translate([0,0,9])
        union() {
            for(l = [0:cube_size:cube_size*(length-1)]) {
                for(w = [0:cube_size:cube_size*(width-1)]) {
                    translate([w,l,0])
                    difference() {
                        translate([0,0,-9]) {
                            if(rounded)
                                intersection() {
                                    r = cube_size*3/4;
                                    translate([0,0,-cube_size/8*5])
                                    rotate([90,0,0])
                                    cylinder(cube_size+2,r,r,center=true);
                                    cube([24, 24, 6], center=true);
                                }
                                else
                                    cube([24, 24, 6], center=true);
                        }
                        angles = [ [270,0,0],[270,0,90]];
                        for ( w = angles) {
                            slot(angle1=w);
                        }
                    }
                }
            }
        }
}

module plate_twosided(length=1,width=1) {
    difference() {
        plate(length, width, false);
        for(l = [-cube_size/2:cube_size:cube_size*length]) {
            for(w = [cube_size/2:cube_size:cube_size*(width-1)]) {
                translate([w, l, -cube_size/8*3])
                slot(angle1 = [90,0,0]);
            }
        }
        for(l = [cube_size/2:cube_size:cube_size*(length-1)]) {
            for(w = [-cube_size/2:cube_size:cube_size*width]) {
                translate([w, l, -cube_size/8*3])
                slot(angle1 = [90,0,90]);
            }
        }
    }
};

module cube_holes(number_holes=2,open=false,support=false) {
    if(open)
        difference() {
            cube_with_side_slots_only(support);
            translate([0,0,6+1])
            cube([cube_size/2,cube_size/2,cube_size/2+2],center=true);
            translate([0,0,-6])
            peg_female();
        }
    else if (number_holes==2)
        difference() {
            cube_with_side_slots_only(support);
            translate([0,0,6])
            peg_female();
            translate([0,0,-6])
            peg_female();
        }
    else
        difference() {
            cube_with_side_slots_only(support);
            translate([0,0,6])
            peg_female();
            angles = [ [270,0,0],[270,0,90]];
            for ( w = angles) {
                slot(angle1 = w);
            }
        }
}

module cube_2open(support=false) {
    r = (axle_diameter + axle_tolerance) / 2;
    union() {
        difference() {
            cube(cube_size, center=true);
            angles = [ [180, 0, 180],[180, 90, 180],
            [90, 180, 0],[90, 180, 90],[90, 0, 0],[90, 0, 90],
            [180, 0, 0],[180, 90, 0] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
            bridging_tolerance = 2*axle_tolerance;
            for (i = [-1:2:1]) {
                translate([i*(axle_diameter/6*8-beam_tolerance), 0, bridging_tolerance/2])
                cube([cube_size/2,cube_size/2,cube_size/2+bridging_tolerance],center=true);
            }
            rotate([0, 90, 0])
            cylinder(cube_size/6+axle_tolerance, r, r, center=true);
        }
        if (support) {
            angles = [ [0, 90, 0], [90, 90, 270] ];
            for ( w = angles) {
                slot_support(angle = w);
            }
        }
    }
}

module connector(length=16) {
    diameter = connector_width - connector_tolerance;
    waist = 2.6;
    slot = 1.3;
    slot_length = length + support_width;
    rotate([90,0,0])
    difference() {
        union() {
            translate([0,-diameter/2,0])
            cylinder(length,diameter/2,diameter/2,center=true);
            translate([0,diameter/2,0])
            cylinder(length,diameter/2,diameter/2,center=true);
            cube([waist,diameter,length],center=true);
        }
        for(i=[-1:2:1]) {
            translate([0,diameter*i*6/5,0])
            cube([diameter,diameter,length+2*diameter],center=true);
            translate([0,diameter*i/2,0])
            cylinder(slot_length,slot,slot,center=true);
        }
    }
}

module cube_smooth(support=true) {
    rotate([0,0,90])
    union() {
        difference() {
            cube(cube_size, center=true);
            angles = [[90,0,0],[90,0,90],[270,0,0],[270,0,90],[0,0,90],
              [0,0,270],[0,90,90],[0,90,270] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
        }
        if (support)
            cube_support();
    }
}

module cube_basic(support=false) {
    difference() {
        cube_with_side_slots_only(support);
        angles = [ [90,0,0],[90,0,90],
            [270,0,0],[270,0,90]];
        for ( w = angles) {
            slot(angle1 = w);
        }
    }
}

module seat(support=true) {
    union() {
        difference() {
            cube([36, 24, 24], center=true);
            angles = [ [0,0,0],[0,90,0],[270,0,0],[270,0,90]];
            for (w = angles) {
                slot(angle1 = w);
            }
            translate([0, -6, 6]) {
                cube([24, 24, 24], center=true);
            }
        }
        if(support)
            translate([0, 11.9, 0])
            cube([35.8, 0.2, 4.2], center=true);
    }
}

module disk() {
    intersection() {
        plate(length=1,width=1);
        cylinder(cube_size/3, cube_size/2, cube_size/2, center=true);
    }
}

// --------------------------------------------------------------------------------
// Internal modules
// --------------------------------------------------------------------------------
module cube_with_side_slots_only(support=true) {
    union() {
        difference() {
            cube(cube_size, center=true);
            angles = [ [0,0,0], [0,0,90], [0,0,180],
              [0,0,270],[0,90,0], [0,90,90],
              [0,90,180],[0,90,270] ];
            for ( w = angles) {
                slot(angle1 = w);
            }
        }
        if (support)
            cube_support();
    }
}

module cube_support() {
    difference() {
        h1 = connector_width;
        h2 = connector_width+2*support_width;
        w = cube_size-2*support_width;
        cube([cube_size, cube_size, h1], center=true);
        cube([w,w,h2], center=true);
    }
}

module slot(angle1, angle2=[0,0,0], distance=cube_size/2, cubes=true) {
    l = connector_width;
    connector_wraist = 3/4*connector_width;
    cylinder_length = cube_size+2;
    corner_tolerance = 1;
    corner_length = (cube_size-3*connector_width)/2+corner_tolerance;
    rotate(a = angle1)
    rotate(a = angle2)
    translate([0, distance-connector_width/2,-cylinder_length/2]) {
        union() {
            cylinder(cylinder_length, l/2, l/2);
            if (cubes) {
                translate([0, 0, connector_wraist/2])
                cube([l,l,corner_length], center=true);
                translate([0, 0, cube_size+corner_tolerance/2])
                cube([l,l,corner_length], center=true);
            }
            translate([0, (connector_width+corner_tolerance)/2, cylinder_length/2]) {
            cube([connector_wraist, connector_wraist, cylinder_length], center=true);
            }
        }
    }
}

module slot_support(angle = [0, 0, 0]) {
    y = (cube_size - support_width) / 2;
    h = connector_width + support_width;
    rotate(a = angle)
    translate([0, y, 0])
    cube([h, support_width, cube_size], center=true);
}

module female_connector() {
    difference() {
        union() {
            l = cube_size/4;
            w = cube_size/2;
            r = cube_size/4;
            h = sin(45)*r;
            points = [ [-l,-w,-r],[-l,w,-r],
                [l,w,-r],[l,-w,-r],
                [-l,h,h],[l,-h,h],[-l,-h,h],[l,h,h]];
            faces = [[0,3,2,1],[0,1,4,6],[3,5,7,2],[4,7,5,6],
                [0,6,5,3],[2,7,4,1]];
            polyhedron(points, faces);
            rotate([0,90,0])
            cylinder(w,r,r,center=true);
        }
        rotate([0,90,0])
        peg_female();
    }
}

module peg_half() {
    axle_radius = axle_diameter/2;
    difference() {
        union() {
            cylinder(cube_size/2,axle_radius,axle_radius);
            cylinder(3,4,4,center=true);
            translate([0,0,1.5])
            cylinder(0.5,4,3);
            translate([0,0,11])
            rotate_extrude()
            translate([3,0,0])
            scale([1,2.66666])
            circle(0.35);
        }
        translate([0,0,9])
        //cube([8,0.8,8],center=true);
        cube([8,1.2,8],center=true);
        for(i=[0:1]) {
            rotate([0,0,180*i])
            translate([4,0,10])
            cube([2.1,5,4],center=true);
        }
        //cylinder(18,1.25,1.25);
        //cylinder(18,1.8,1.8);
        cylinder(18,1.9,1.9);
    }
}

module peg_female() {
    union() {
        for(i=[0,1])
        rotate([180*i,0,0]) {
            cylinder(7.5,3.1,3.1);
            translate([0,0,4])
            cylinder(0.5,3.1,4.1);
            translate([0,0,4.5])
            cylinder(3,4.1,4.1);
        }
    }
}

module peg_female_with_lock() {
    difference() {
        peg_female();
        connector_lock(8);
    }
}

module connector_lock(length_mm = 8) {
    difference() {
        cylinder(length_mm,4.5,4.5,center=true);
        cube([axle_diameter/6*5+axle_tolerance,axle_diameter+axle_tolerance,length_mm+2],center=true);
    }  
}

module prism(length=24,width=24,height=12) {
        l = length/2;
        w = width/2;
        h = height;
        points = [ [-l,-w,0],[-l,w,0],
            [l,w,0],[l,-w,0],
            [-l,0,h],[l,0,h]];
        faces = [[0,3,2,1],[0,1,4],[3,5,2],
            [0,4,5,3],[2,5,4,1]];
        polyhedron(points, faces);
}

module beam_with_outer_connectors(number_holes=5,hight=5.9,rounded=false,tolerance=beam_tolerance) {
    pos = (number_holes-1)*cube_size/4;
    radius = cube_size/4-tolerance/2;
    z_distance = rounded?0:radius;
        difference() {
            union() {
                hull() {
                    translate([-pos,0,0])
                    cylinder(hight, radius, radius);
                    translate([pos,0,0])
                    cylinder(hight, radius, radius);
                }
                translate([-pos,0,z_distance])
                if (rounded)
                    cylinder(2*radius, radius, radius);
                else
                    cube([2*radius,2*radius,2*radius], center=true);
                translate([pos,0,z_distance])
                if (rounded)
                    cylinder(2*radius, radius, radius);
                else
                    cube([2*radius, 2*radius, 2*radius], center=true);
            }
            translate([-pos,0,6])
            peg_female();
            translate([pos,0,6])
            peg_female();
        }
}

module spoke_wheel_impl(outer_radius=cube_size/12*9,inner_radius=cube_size/12*7,width=8,rounding_radius=cube_size/24,number_spokes=12,spoke_height=cube_size/6,rim_depth=0.5,locked=false) {
    w = width-2*rounding_radius;
    ro = outer_radius-rounding_radius;
    ri = inner_radius;
    rim_heigth = w;
    spoke_width = cube_size/12;
    union() {
        difference() {
            minkowski() {
                cylinder(w,ro,ro,center=true);
                sphere(rounding_radius,center=true);
            }
            cylinder(w+2,ri,ri,center=true);
            if(rim_depth>0)
            difference() {
                cylinder(rim_heigth,outer_radius+1,outer_radius+1,center=true);
                cylinder(rim_heigth+1,outer_radius-rim_depth,outer_radius-rim_depth,center=true);
            }
        }
        r = 0.5*(axle_diameter+axle_tolerance);
        translate([0,0,-(width-cube_size/3)/2]) {
            difference() {
                cylinder(cube_size/3,5,5,center=true); // add axle_tolerance?
                cylinder(cube_size/3+2,r,r,center=true);
            }
            if(locked)
                connector_lock(cube_size/3);
        }
        for(i=[0:number_spokes-1]) {
            l = inner_radius-axle_diameter/2;
            rotate([0,0,360/number_spokes*i])
            translate([l/2+r,0,-(width-spoke_height)/2])
            cube([l,spoke_width,spoke_height],center=true);
        }
    }
}
