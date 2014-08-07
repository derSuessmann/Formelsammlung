/*
  \title{Figure double slits}
  \author{Boris Süssmann}
  
  This work is licensed under the Creative Commons
  Attribution-ShareAlike 3.0 Unported License. To view a copy of this license,
  visit http://creativecommons.org/licenses/by-sa/3.0/deed.en_US.
*/

import graph;
usepackage("amsmath");
usepackage("cmbright");

size(7cm,5cm); 
real labelscalefactor = 0.5; /* changes label-to-point distance */
pen dps = linewidth(0.3) + fontsize(10); defaultpen(dps); /* default pen style */

real w = 1, h=1.5*w;
real x0 = 0, y0 = 0;
real angle_radius = 40;
real xmin = x0-2,
     xmax = x0+w+2,
     ymin = y0-2,
     ymax = y0+h+2;  /* image dimensions */
pen color_angle = rgb(0.0,0.4,0.0); 

real d = 20;     // distance between slits
real gap = d/10; // width of slit
real e = 200;    // distance from slits to screen
real a = 60;     // distance from maximum 0 to maximum 1
real alpha;      // angle to maximum 1
alpha = atan(a/e);
real screenlength = 2*a + 10;
real screenwidth = 2;
real x0 = e/5, y0 = 1.8*a; // coordinates for zoomed slits
real zoom = 3;

pen lens_pen = gray+dotted;
draw(circle((0,0), 32), lens_pen); 
draw(circle((x0,y0), 70), lens_pen);
draw((-32,0)--(x0-70,y0), lens_pen);
draw((30,-15)--(x0+54,y0-45), lens_pen);

// draw center line
draw((0,0)--(e,0), dashdotted);
label("$e$", (e/2,0), N*labelscalefactor);

real l = sqrt(e^2+a^2);
draw((0,d/2)--(e,a), blue);
label("$\text{Sp}_2$", (0-screenwidth, d/2), W*labelscalefactor, blue);
draw((0,-d/2)--(e,a), green);
label("$\text{Sp}_1$", (0-screenwidth, -d/2), W*labelscalefactor, green);

draw((0,0)--(e,a), dashed, BeginArrow(4), EndArrow(4));
label("$\ell$", (e/2,a/2));
draw(arc((0,0), angle_radius, 0, degrees(alpha)));
label("$\alpha$", (0+angle_radius,0+angle_radius/e*a/2), E *labelscalefactor);

// draw screen
fill((e,-screenlength/4)--(e+screenwidth,-screenlength/4)--(e+screenwidth,screenlength/2)--(e,screenlength/2)--cycle, gray);
label("Schirm", (e+screenwidth,-screenlength/4), NE*labelscalefactor);

draw((e+screenwidth,0)--(e+screenwidth+15,0));
draw((e+screenwidth,a)--(e+screenwidth+15,a));
draw((e+screenwidth+10,0)--(e+screenwidth+10,a), BeginArrow(4), EndArrow(4));
label("$a$", (e+screenwidth+10,a/2), E*labelscalefactor);

void drawslits(real x0, real y0, real distance, real gap,
	       real width, real length) {
  real middle_of_slit = distance / 2;
  real top_of_slit = (distance + gap) / 2;
  real bottom_of_slit = (distance - gap) / 2;
  
  // draw upper part
  fill((x0, y0+top_of_slit)--(x0, y0+length/2)--
       (x0-width, y0+length/2)--(x0-width, y0+top_of_slit+width)--cycle, gray);
  // draw middle part
  fill((x0, y0+bottom_of_slit)--(x0-width, y0+bottom_of_slit-width)--
       (x0-width, y0-bottom_of_slit+width)--(x0, y0-bottom_of_slit)--cycle, gray);
  // draw lower part
  fill((x0, y0-top_of_slit)--(x0, y0-length/2)--
       (x0-width, y0-length/2)--(x0-width, y0-top_of_slit-width)--cycle, gray);
}

drawslits(0, 0, d, gap, screenwidth, screenwidth*20);

// draw zoom on slits
drawslits(x0, y0, d*zoom, gap*zoom, screenwidth*zoom, screenwidth*20*zoom);
// draw labels and slit distance
label("$\text{Sp}_2$", (x0-screenwidth*zoom, y0+d*zoom/2),
      NW*labelscalefactor, blue);
draw((x0, y0+d*zoom/2)--(-10, y0+d*zoom/2)); 
label("$\text{Sp}_1$", (x0-screenwidth*zoom, y0-d*zoom/2),
      NW*labelscalefactor, green);
draw((x0, y0-d*zoom/2)--(-10, y0-d*zoom/2)); 
draw((0,y0+d*zoom/2)--(0, y0-d*zoom/2), BeginArrow(4), EndArrow(4));
label("$d$", (0, y0), W*labelscalefactor);
// draw beams
real factor2 = (a-d/2)/e;
real factor1 = (a+d/2)/e;
draw((x0, y0)--(3*x0, y0), dashdotted*zoom);
path p2 = (x0, y0+d*zoom/2)--(3*x0, y0+d*zoom/2+2*x0*a/e);
draw(p2, blue); 
draw((x0, y0)--(3*x0, y0+2*x0*a/e), dashed, BeginArrow(4)); 
path p1 = (x0, y0-d*zoom/2)--(3*x0, y0-d*zoom/2+2*x0*a/e);
draw(p1, green); 
draw(arc((x0,y0), angle_radius, 0, degrees(alpha)));
label("$\alpha$", (x0+angle_radius,y0+angle_radius/e*a/2), E *labelscalefactor);
path p3 = (x0,y0+d*zoom/2)--(x0+d*zoom*a/e,y0-d*zoom/2); // p2 rotated 90 degree clockwise
real [] i = intersect(p1,p3);
draw(point(p3, 0)--point(p3,i[1]));
draw(arc((x0,y0+d*zoom/2), d*zoom*0.75, 270, 270+degrees(alpha)));
draw(point(p1, 0)--point(p1,i[0]));
label("$\alpha$", (x0+2.5*zoom,y0-4.5*zoom), S *labelscalefactor);
label("$\Delta s$", (x0,y0-d*zoom/2), SE *labelscalefactor);

//clip((xmin,ymin)--(xmin,ymax)--(xmax,ymax)--(xmax,ymin)--cycle); 
