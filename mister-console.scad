
// power switch dimensions
psw_x=13;
psw_y=20;
psw_z=20;

// outer box dimensions
sh_x=180;
sh_y=150;
sh_z=50;

// standoff details
mister_depth=62;
mister_width=100;

// rotational segment count
$fn=24;

module switch() {
    cube([psw_x,psw_y,psw_z]);
}

module led() {
    cylinder(h=10,r=1.5,center=false);
}

module powerjack() {
    thread_radius=3.75;
    lip_radius=5.25;
    
    rotate([-90,0,0])
    union() {
        cylinder(h=10,r=thread_radius,center=false);
        translate([0,0,10])
        cylinder(h=5,r=lip_radius,center=false);
    }
}

module etherjack() {
    ejx=16.5;
    ejz=13.5;
    ejy=20;
    // hole spacing
    ejhs=27.5;
    
    translate([5.75,0,0])
    cube([ejx,ejy,ejz]);
    
    translate([ejhs,0,8.5])
    rotate([-90,0,0])
    union() {
        cylinder(h=ejy,r=1.5,center=false);
        translate([0,0,ejy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }

    translate([0,0,8.5])
    rotate([-90,0,0])
    union() {
        cylinder(h=ejy,r=1.5,center=false);
        translate([0,0,ejy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }
}

module hdmi_jack() {
    hdx=18;
    hdz=9;
    hdy=20;
    // hole spacing
    hdhs=27;
    
    translate([5.75,0,0])
    cube([hdx,hdy,hdz]);
    
    translate([hdhs,0,hdz/2])
    rotate([-90,0,0])
    union() {
        cylinder(h=hdy,r=1.5,center=false);
        translate([0,0,hdy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }

    translate([0,0,hdz/2])
    rotate([-90,0,0])
    union() {
        cylinder(h=hdy,r=1.5,center=false);
        translate([0,0,hdy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }
}

module usb_jack() {
    hdx=18;
    hdz=10;
    hdy=20;
    // hole spacing
    hdhs=30;
    
    translate([5.75,0,0])
    cube([hdx,hdy,hdz]);
    
    translate([hdhs,0,hdz/2])
    rotate([-90,0,0])
    union() {
        cylinder(h=hdy,r=1.5,center=false);
        translate([0,0,hdy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }

    translate([0,0,hdz/2])
    rotate([-90,0,0])
    union() {
        cylinder(h=hdy,r=1.5,center=false);
        translate([0,0,hdy-1.5])
        cylinder(h=1.5,r=3,center=false);
    }
}

module junk_in_the_box() {
    translate([6,sh_y-18,sh_z-psw_z-6])
    switch();
    
    translate([12,sh_y-14,12])
    powerjack();
    
    translate([30,sh_y-20,12])
    hdmi_jack();
    
    translate([sh_x-40,sh_y-20,8+12])
    usb_jack();
    
    translate([sh_x-40,sh_y-20,8])
    usb_jack();
    
    translate([sh_x-90,sh_y-20,8])
    etherjack();
}

module mister_standoff() {
    difference() {
        translate([-5,-5,0])
        cube([10,10,9]);
        
        translate([0,0,2])
        cylinder(h=7,r=2.3,center=false);
    }
}

module mister_standoffs() {
    mister_standoff();

    translate([mister_width,0,0])
    mister_standoff();
    
    translate([0,mister_depth,0])
    mister_standoff();
    
    translate([mister_width,mister_depth,0])
    mister_standoff();
}

module shell_bottom() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            difference() {
                cube([sh_x,sh_y,sh_z]);
                
                translate([0,th,th])
                cube([sh_x,sh_y-thx2,sh_z]);
            }
            
            // re-enforcement plate for power jack
            translate([2,sh_y-(th+2),2])
            cube([20,2,20]);
            
            translate([40,20,0])
            mister_standoffs();
        }
    
        junk_in_the_box();
    }
}


shell_bottom();

//junk_in_the_box();
