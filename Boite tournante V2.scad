module dessous(ep=0.75) {
    union() {
        difference() {
            intersection() {
                cube(50,center=true);
                cylinder(d1=54.5,d2=59.5,h=15,center=true,$fn=100);
            }
            intersection() {
                cube(50-2*ep,center=true);
                cylinder(d1=54.5-2*ep,d2=59.5-2*ep,h=15.01,center=true,$fn=100);
            }
        }
    // Cube externe (arrondi) => cube([50,50,30]);
        difference() {
            translate([0,0,-15]) hull() {
                for(x=[-25+2.5,25-2.5],y=[-25+2.5,25-2.5]) {
                    translate([x,y,-7.5+2.5]) sphere(d=5,center=true,$fn=20);
                    translate([x,y,7.5-2.5]) cylinder(d=5,h=5,center=true,$fn=20);
                }
            }
    // Evidement intérieur du cube
            translate([0,0,-15]) intersection() {
                hull() {
                    for(x=[-25+2.5+ep,25-2.5-ep],y=[-25+2.5+ep,25-2.5-ep]) {
                        translate([x,y,-7.5+2.5+ep]) sphere(d=5,center=true,$fn=20);
                        translate([x,y,7.5-2.5+.01]) cylinder(d=5,h=5,center=true,$fn=20);
                    }
                }
                cylinder(d=54.5-2*ep,h=50,center=true,$fn=100);
            }
        }
    }
}


module dessus(ep=0.75) 
{
    difference() {
        translate([0,0,7.5]) {
            difference() {
// Cube externe (arrondi) => cube([50,50,30]);
                hull() {
                    for(x=[-25+2.5,25-2.5],y=[-25+2.5,25-2.5]) {
                        translate([x,y,15-2.5]) sphere(d=5,center=true,$fn=20);
                        translate([x,y,-15+2.5]) cylinder(d=5,h=5,center=true,$fn=20);
                    }
                }
// Cube interne
                intersection() {
                    hull() {
                        cube([50-2*ep,50-2*ep,0.1],center=true);
                        for(x=[-25+ep+2.5,25-ep-2.5],y=[-25+ep+2.5,25-ep-2.5]) translate([x,y,12.5-ep]) sphere(d=5,center=true,$fn=20);
                    }
                    cylinder(d=60.5,h=30,center=true,$fn=100);
                }
            }
        }
// Evidement conique
        cylinder(d1=55.5,d2=60.5,h=15,center=true,$fn=100);
// Supression limite sup.
        translate([0,0,-7.5]) cylinder(d=55.5,h=1,center=true,$fn=100);
    }   
}

translate([50,0,0]) rotate([180,0,0]) dessus();
translate([-50,0,0]) dessous();