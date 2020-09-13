
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
    
    translate([(hdhs-hdx)/2,0,0])
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

module nine_pin() {
    union() {
        cube([31,40.5,15]);
    
        // todo: shape this more precisely, rounded/tapered...
        translate([(31-18)/2,-6,(15-9.3)/2])
        cube([18,6,9.3]);
        
        translate([-1.5,0,-3])
        cube([34,14.5,6]);

        translate([-1.5,3,-5])
        cube([34,11.5,6]);
        
        translate([2.9,-5,7.5])
        rotate([-90,0,0])
        cylinder(h=5,r=2.8,center=false);

        translate([31-2.9,-5,7.5])
        rotate([-90,0,0])
        cylinder(h=5,r=2.8,center=false);
    }
}

module push_button() {
    rotate([-90,0,0])
    cylinder(h=22,r=4,center=false);
    
    translate([-7,12.5,-8])
    cube([14,60,16]);
    
    translate([-6,0,-5.25])
    cube([12,10.5,10.5]);
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
    
    // 9pin ports
    translate([70-3,-10.3,8])
    nine_pin();
    
    translate([sh_x-70-25-3,-10.3,8])
    nine_pin();
    
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
    
    // front to top screw holes
    translate([40,35,sh_z-5])
    rotate([-90,0,0])
    screw_hole();

    translate([sh_x-40,35,sh_z-5])
    rotate([-90,0,0])
    screw_hole();
    
    // leds
    translate([sh_x-25,-20,sh_z-10])
    cube([10,40,2]);

    translate([sh_x-25,-20,sh_z-16])
    cube([10,40,2]);
    
    translate([sh_x-25,-20,sh_z-22])
    cube([10,40,2]);
    
    // led block cutout
    translate([sh_x-27,-14,sh_z-37])
    cube([14,60,30]);
    
    // push buttons
    translate([21,-16,37])
    push_button();
    
    translate([21,-16,25])
    push_button();
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
            translate([-th,0,0])
            cube([th,sh_y,sh_z]);

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
            translate([sh_x,0,0])
            cube([th,sh_y,sh_z]);
                            
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

module mister_logo() {
    import(file = "logo.svg", center = false, dpi = 96);
}

module shell_front() {
    th=3;
    thx2=th*2;
    
    difference() {
        union() {
            translate([-3,-16,0])
            cube([sh_x+6,19,sh_z+3]);
            
            difference() {
                translate([-3,0,20])
                cube([sh_x+6,45,30+3]); 
                
                translate([0,3,20])
                rotate([35,0,0])
                translate([0,0,-50])
                cube([sh_x+6,65,50]);
            }
                        
            // brackets
            translate([40,3,3])
            rotate([0,0,90])
            bracket();  

            translate([sh_x-40,3,3])
            rotate([0,0,90])
            bracket();  
            
            // top brackets
            translate([40-3,35,sh_z-10])
            cube([6,10,10]);

            translate([sh_x-40-3,35,sh_z-10])
            cube([6,10,10]);
        }
    
        junk_in_the_box();

        // cut-outs for side panels
        translate([-3,0,0])
        cube([3,sh_y,sh_z]);

        translate([sh_x,0,0])
        cube([3,sh_y,sh_z]);

        // outer shaping
        translate([30,-20,5])
        difference() {
            translate([0,0,20])
            cube([140,45,30+3]); 
            
            translate([0,3,20])
            rotate([35,0,0])
            translate([0,0,-50])
            cube([140,65,50]);
        }
        
        // left front edge
        translate([-3,-16,0])
        rotate([0,0,45])
        translate([-10,-10,0])
        cube([20,20,sh_z+3]);
        
        // right front edge
        translate([sh_x+3,-16,0])
        rotate([0,0,45])
        translate([-10,-10,0])
        cube([20,20,sh_z+3]);

        // bottom front edge
        translate([0,-22,0])
        rotate([45,0,0])
        translate([-3,-10,-10])
        cube([sh_x+6,20,20]);
        
        // top front edge
        translate([0,-22,sh_z+15])
        rotate([35,0,0])
        translate([-3,-20,-20])
        cube([sh_x+6,40,40]);
    }
    
    translate([35,-15,25])
    rotate([35,0,0])
    scale([0.7,0.7,1])
    linear_extrude(height = 3)
    mister_logo();
}

module shell_front_part2() {
    union() {
        difference() {
            shell_front();
            
            translate([30,-30,-10])
            cube([200,100,100]);
        }
    
        translate([25,0,0])
        cube([10,3,5]);

        translate([28,20,31])
        rotate([35,0,0])
        cube([7,5,3]);
    }
}

module shell_front_part3() {
    union() {
        difference() {
            shell_front();
            
            translate([-10,-30,-10])
            cube([180,100,100]);
        }
        
        translate([sh_x-35,0,0])
        cube([10,3,5]);

        translate([sh_x-35,20,31])
        rotate([35,0,0])
        cube([7,5,3]);
    }
}

module shell_front_part1() {
    difference() {
        shell_front();
        
        shell_front_part2();
        
        shell_front_part3();
    }
}

module top_cover() {
    difference() {
        translate([-3,45,sh_z])
        union() {
            cube([206,sh_y-45,3]);
            
            // left mount tab
            translate([40,0,-10])
            cube([9,3,10]);
            
            translate([46,0,-10])
            cube([3,6,10]);
            
            // right mount tab
            translate([sh_x-43,0,-10])
            cube([9,3,10]);
            
            translate([sh_x-43,0,-10])
            cube([3,6,10]);
            
            // rear screw bracket
            translate([(sh_x/2),sh_y-45-19,-10])
            cube([6,16,10]);
            
            // fit guides
            //  - left
            translate([3,0,-2])
            cube([2,sh_y-48,2]);
            //  - right
            translate([sh_x+3-2,0,-2])
            cube([2,sh_y-48,2]);
            //  - rear
            translate([3,sh_y-45-5,-2])
            cube([sh_x,2,2]);
            //  - front
            translate([3,0,-2])
            cube([sh_x,2,2]);
            // ribbing
            translate([3,50,-2])
            cube([sh_x,2,2]);
            translate([3,100,-2])
            cube([sh_x,2,2]);
        }
        
        junk_in_the_box();
    }
}

module top_cover_left() {
    difference() {
        top_cover();
        
        translate([sh_x/2,0,25])
        cube([sh_x/2+10,sh_y,50]);
    }
    
    translate([sh_x/2-5,47,sh_z-2])
    cube([10,20,2]);
}

module top_cover_right() {
    difference() {
        top_cover();
        
        translate([-10,0,25])
        cube([sh_x/2+10,sh_y,50]);
    }

    translate([sh_x/2-5,135,sh_z-2])
    cube([10,10,2]);
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
    
    translate([0,0,0])
    shell_front();
    
    translate([0,0,10])
    top_cover();
}

// render this to visualize the entire set of parts.
//parts_to_print();

// render this to visualize the parts removed from
// the panels...
//junk_in_the_box();

//shell_bottom();

//translate([sh_z,0,0])
//rotate([0,-90,0])
//translate([3,0,0])
//shell_left();

//rotate([0,90,0])
//translate([-sh_x-3,0,0])
//shell_right();

//rotate([-90,0,0])
//translate([0,-sh_y,0])
//shell_back();

//translate([0,-10,10])
//rotate([-35,0,0])
//shell_front_part1();

//translate([-10,-10,10])
//rotate([-35,0,0])
//shell_front_part2();

//translate([10,-10,10])
//rotate([-35,0,0])
//shell_front_part3();

//translate([3,sh_y-45,0])
//rotate([180,0,0])
//translate([0,-45,-sh_z-3])
//top_cover_left();

translate([5-sh_x/2,sh_y-45,0])
rotate([180,0,0])
translate([0,-45,-sh_z-3])
top_cover_right();