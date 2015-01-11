// Adapto is licensed under the Creative Commons - GNU GPL license.
// http://creativecommons.org/licenses/GPL/2.0/
include <./inc/configuration.scad>
use <./inc/polyarc.scad>

yBlock_Flex();

module yBlock_Flex(){
	length=M3nut*2+25+M3nut*2;

	difference(){

		union(){
			// belt base
			cube([length, linearBearing[2], thickness]);
			translate([length/2-linearBearing[1]/2, 0, 0])
				cube([linearBearing[1], linearBearing[2], thickness/2+linearBearing[1]/2+smoothRod/2+frameY/2.6]);

			// belt clamp
			translate([0, linearBearing[2]+10, 0])
				cube([linearBearing[1], linearBearing[2], thickness]);

		}// end union

		// base mount holes and traps
		translate([4, linearBearing[2]/2, -1])
			polycyl(d=M3, h=thickness+2);
		translate([length-4, linearBearing[2]/2, -1])
			polycyl(d=M3, h=thickness+2);
		translate([4, linearBearing[2]/2, thickness-2])
			rotate([0, 0, 90])
			polynut(d=M3nut, h=2+1);
		translate([length-4, linearBearing[2]/2, thickness-2])
			rotate([0, 0, 90])
			polynut(d=M3nut, h=2+1);

		// base clamp holes and traps
		translate([length/2, M3, -1])
			polycyl(d=M3, h=40);
		translate([length/2, linearBearing[2]-M3, -1])
			polycyl(d=M3, h=40);
		translate([length/2, M3, -1])
			polynut(d=M3nut, h=M3nutThickness+1);
		translate([length/2, linearBearing[2]-M3, -1])
			polynut(d=M3nut, h=M3nutThickness+1);

		// belt clamp holes
		translate([linearBearing[1]/2, linearBearing[2]+10+M3, -1])
			polycyl(d=M3, h=thickness+2);
		translate([linearBearing[1]/2, linearBearing[2]+10+linearBearing[2]-M3, -1])
			polycyl(d=M3, h=thickness+2);

	}// end difference

}