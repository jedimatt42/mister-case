
module button_cap() {
    difference() {
        cube([12,7,10.5]);
        
        translate([1,2.5,1])
        cube([10,5.5,8.5]);
        
        translate([6,1.5,5.25])
        rotate([-90,0,0])
        cylinder(h=2,r=3.25,$fn=20);
    }
}

rotate([-90,0,0])
translate([0,-7,0])
button_cap();