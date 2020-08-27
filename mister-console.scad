
// outer box dimensions
sh_x=200;
sh_y=180;
sh_z=50;

// power switch dimensions
psw_x=13;
psw_y=20;
psw_z=20;

// standoff details
mister_depth=62;
mister_width=100;

hub_width=23;
hub_depth=58;

// brass threaded inset
thread_inset=1.55;

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

module fan_screw() {
    cylinder(h=10,r=1.2,center=false);
    
    translate([0,0,5])
    cylinder(h=3,r=2.1,center=false);
}

module fan() {
    cube([8,30,30]);

    translate([3,30-3,30-3])
    rotate([0,-90,0])
    fan_screw();
    
    translate([3,30-3,3])
    rotate([0,-90,0])
    fan_screw();
    
    translate([3,3,30-3])
    rotate([0,-90,0])
    fan_screw();
    
    translate([3,3,3])
    rotate([0,-90,0])
    fan_screw();
}

module side_vent() {
    // horizontal slats - partial depth
    for(x=[0:3:30])
    translate([1,0,x])
    cube([2,50,1.5]);
    
    // vertical cut in from outside
    for(x=[0:10:40])
    translate([0,x,0])
    cube([1,8,33]);
}
    
module fan_mount() {
    difference() {
        side_vent();
        
        // leave behind mounting support
        translate([3,13,3])
        rotate([0,-90,0])
        cylinder(h=2,r=3.1,center=false);

        translate([3,13+24,3])
        rotate([0,-90,0])
        cylinder(h=2,r=3.1,center=false);
        
        translate([3,13,3+24])
        rotate([0,-90,0])
        cylinder(h=2,r=3.1,center=false);
        
        translate([3,13+24,3+24])
        rotate([0,-90,0])
        cylinder(h=2,r=3.1,center=false);
    }
}

module screw_hole() {
    cylinder(h=20,r=thread_inset,center=false);
}

module junk_in_the_box() {
    translate([12,sh_y-18,sh_z-psw_z-6])
    switch();
    
    translate([18,sh_y-14,12])
    powerjack();
    
    translate([36,sh_y-20,22])
    hdmi_jack();
    
    translate([sh_x-50,sh_y-20,8+24])
    usb_jack();
    
    translate([sh_x-50,sh_y-20,8+12])
    usb_jack();
    
    //translate([sh_x-50,sh_y-20,8])
    //usb_jack();
    
    translate([sh_x-90,sh_y-20,18])
    etherjack();
    
    translate([0,50,5])
    fan();
    
    translate([-3,40,5])
    fan_mount();
    
    translate([sh_x+3,40,5])
    scale([-1,1,1])
    side_vent();
    
    // bottom assembly screw holes
    translate([6,20,-5])
    screw_hole();
    translate([6,sh_y-20,-5])
    screw_hole();
    translate([sh_x-6,20,-5])
    screw_hole();
    translate([sh_x-6,sh_y-20,-5])
    screw_hole();
    
    // rear assembly screw holes
    translate([6,sh_y-15,sh_z-20])
    rotate([-90,0,0])
    screw_hole();    
    translate([sh_x-6,sh_y-15,sh_z-20])
    rotate([-90,0,0])
    screw_hole();
    translate([100,sh_y-15,sh_z-6])
    rotate([-90,0,0])
    screw_hole();
    
    // front to bottom screw holes
    translate([40,9,-5])
    screw_hole();
    translate([sh_x-40,9,-5])
    screw_hole();
}

module mister_standoff() {
    difference() {
        translate([-5,-5,0])
        cube([10,10,14]);
        
        translate([0,0,2])
        cylinder(h=12,r=thread_inset,center=false);
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

module hub_standoff() {
    difference() {
        translate([-3,-3,0])
        cube([6,6,8]);
        
        translate([0,0,2])
        cylinder(h=6,r=thread_inset,center=false);        
    }
}

module gen_standoffs(width, depth) {
    hub_standoff();

    translate([width,0,0])
    hub_standoff();
    
    translate([0,depth,0])
    hub_standoff();
    
    translate([width,depth,0])
    hub_standoff();
}

module hub_standoffs() {
    gen_standoffs(hub_width, hub_depth);
}

module mjdc_standoffs() {
    gen_standoffs(25, 20);
    
    translate([7.5,0,0])
    cube([10,20,6]);
    
    translate([1.5,-3,0])
    cube([22,6,6]);
    
    translate([1.5,17,0])
    cube([22,6,6]);
}


module bottom_vent(x) {
    translate([x,20,0])
    cube([3,45,3]);

    translate([x,85,0])
    cube([3,45,3]);
}

module stress_cutouts(limit) {
    for(x=[20:40:limit])
    translate([x,0,0])
    scale([1,2,1])
    cylinder(h=10,r=1.3,center=false);  
}

module shell_bottom() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            difference() {
                translate([0,th,0])
                cube([sh_x,sh_y-thx2,sh_z]);
                
                translate([0,0,th])
                cube([sh_x,sh_y,sh_z]);

                for(x=[20:10:sh_x-20])
                bottom_vent(x);
            }
            
            translate([50,50,0])
            mister_standoffs();
            
            translate([70,160,0])
            rotate([0,0,-90])
            hub_standoffs();
            
            translate([70,7,0])
            mjdc_standoffs();
            
            translate([sh_x-70-25,7,0])
            mjdc_standoffs();
        }
    
        junk_in_the_box();
        
        // stress relief
        translate([0,3,-4])
        stress_cutouts(sh_x-10);
    
        translate([0,sh_y-3,-4])
        stress_cutouts(sh_x-10);
        
        translate([0,10,-4])
        rotate([0,0,90])
        stress_cutouts(sh_y-10);
        
        translate([200,10,-4])
        rotate([0,0,90])
        stress_cutouts(sh_y-10);
        
        for(x=[15:60:sh_x-18])
        translate([x,73.5,0])
        cube([50,3,3]); 
        
        for(x=[15:60:sh_x-18])
        translate([x,150.5,0])
        cube([50,3,3]); 
    }
}


module bracket() {
    translate([0,-3,0])
    cube([10,6,10]);
}

module rear_bracket() {
    translate([0,0,-3])
    cube([10,10,6]);
}

module shell_back() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            difference() {
                cube([sh_x,sh_y,sh_z]);
                
                translate([0,0,0])
                cube([sh_x,sh_y-th,sh_z]);
            }
            
            // re-enforcement plate for power jack
            translate([8,sh_y-th-2,th])
            cube([20,2,20]);
            
            // guide edge for bottom
            translate([0,sh_y-th-2,th])
            cube([sh_x,2,2]);
        }
    
        junk_in_the_box();
        
        // stress relief
        translate([0,sh_y-3,0])
        rotate([-90,0,0])
        stress_cutouts(sh_x-10);

        translate([0,sh_y-3,sh_z])
        rotate([-90,0,0])
        stress_cutouts(sh_x-10);
    }
}

module shell_left() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            difference() {
                translate([-th,0,0])
                cube([th,sh_y,sh_z]);
                
                cube([sh_x,sh_y,sh_z]);
            }

            // guide edge for bottom
            translate([0,th+2,th])
            cube([2,sh_y-4-thx2,2]); 
 
            // brackets
            translate([0,20,th])
            bracket();  
   
            translate([0,sh_y-20,th])
            bracket();
            
            translate([0,sh_y-13,sh_z-20])
            rear_bracket();
        }
    
        junk_in_the_box();
        
        // stress relief
        translate([0,10,0])
        rotate([-90,0,90])
        stress_cutouts(sh_y-10);
        
        translate([0,10,sh_z])
        rotate([-90,0,90])
        stress_cutouts(sh_y-10);
    }
}

module shell_right() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            difference() {
                translate([sh_x,0,0])
                cube([th,sh_y,sh_z]);
                
                cube([sh_x,sh_y,sh_z]);
            }
            
            // guide edge for bottom
            translate([sh_x-2,th+2,th])
            cube([2,sh_y-4-thx2,2]);
 
            // brackets
            translate([sh_x,20,th])
            scale([-1,1,1])
            bracket();  
   
            translate([sh_x,sh_y-20,th])
            scale([-1,1,1])
            bracket();
            
            translate([sh_x,sh_y-13,sh_z-20])
            scale([-1,1,1])
            rear_bracket();
        }
    
        junk_in_the_box();
        
        // stress relief
        translate([sh_x,10,0])
        rotate([90,0,90])
        stress_cutouts(sh_y-10);
        
        translate([sh_x,10,sh_z])
        rotate([90,0,90])
        stress_cutouts(sh_y-10);
    }
}

module parts_to_print() {
    shell_bottom();

    translate([0,sh_y+10,0])
    rotate([-90,0,0])
    translate([0,-sh_y,0])
    shell_back();

    translate([-10,0,0])
    rotate([0,-90,0])
    translate([3,0,0])
    shell_left();

    translate([sh_x+10,0,0])
    rotate([0,90,0])
    translate([-sh_x-3,0,0])
    shell_right();
}

parts_to_print();

//shell_bottom();

//translate([sh_z,0,0])
//rotate([0,-90,0])
//translate([3,0,0])
//shell_left();

junk_in_the_box();
