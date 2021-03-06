use <lib_boxes3.scad>
use <lib_cutouts.scad>

//$fn = 30.00;

x1 = 50;
y1 = 100;
z1 = 60;
r1 = 10.00;
d1 = 1.20;
ro = 7.00;
ri = 5.00;
fn = 30.00;


difference() {
	open_box(x1, y1, z1, r1, d1);

	*linear_extrude(d1) {
		translate([r1/2, r1/2, 0]) {
			honeycomb(x1-r1, y1-r1, ro, ri, fn);
		}
	}

	translate([x1, 0, 0]) {
		rotate([0, -90, 0]) {
			linear_extrude(x1+0.01) {
				translate([r1/2, r1/2, 0]) {
					honeycomb(z1-r1, y1-r1, ro, ri, fn);
				}
			}
		}
	}

	translate([0, 0, 0]) {
		rotate([0, -90, -90]) {
			linear_extrude(x1+0.01) {
				translate([r1/2, r1/2, 0]) {
					honeycomb(z1-r1, x1-r1, ro, ri, fn);
				}
			}
		}
	}
}
