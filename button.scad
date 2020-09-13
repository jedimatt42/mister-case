
module button_cap() {
    x=11;
    z=9.5;
    
    difference() {
        cube([x,7,z]);
        
        translate([1,2.5,1])
        cube([x-2,5.5,z-2]);
        
        translate([x/2,1.5,z/2])
        rotate([-90,0,0])
        cylinder(h=2,r=3.25,$fn=20);
    }
}

rotate([-90,0,0])
translate([0,-7,0])
button_cap();