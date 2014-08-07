/*
  \title{Figure trigonometry}
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
pen dps = linewidth(0.3) + fontsize(12); defaultpen(dps); /* default pen style */

// angles in degrees
real alpha = 30;
real beta = 60;
real gamma = 90;

real alpha_rad = alpha*pi/180;

pair A = (0,0);
pair B = (1,0);
pair C = (cos(alpha_rad)^2,sin(alpha_rad)*cos(alpha_rad));

// trial and error to get a harmonic relation from side to angle arc
real angle_dist = (xpart(B)-xpart(A))/6;

draw(arc(A, angle_dist, 0, alpha)--A--cycle);
draw(arc(B, angle_dist, 90+alpha, 180)--B--cycle);
draw(arc(C, angle_dist, 180+alpha, 270+alpha)--C--cycle);

draw(A--B--C--cycle);

label("A", A, W*labelscalefactor);
label("B", B, E*labelscalefactor);
label("C", C, N*labelscalefactor);

// trial and error to get a harmonic placement of the label for an angle
real angle_label_dist = angle_dist*3/4;

// calculate the position of the label for an angle
pair angle_label_pos(pair P, real dist, real angle_from, real angle_to) {
  return (xpart(P)+dist*cos((angle_from+angle_to)/2),ypart(P)+dist*sin((angle_from+angle_to)/2));
}

label("$\alpha$", angle_label_pos(A, angle_label_dist, 0, alpha_rad));
label("$\beta$", angle_label_pos(B, angle_label_dist, pi/2+alpha_rad, pi));
// the circle marking a right angle must be placed specially
fill(circle(angle_label_pos(C, angle_dist*0.58, pi+alpha_rad, 3/2*pi+alpha_rad), 0.005));

label("a", (B+C)/2, NE*labelscalefactor);
label("b", (A+C)/2, NW*labelscalefactor);
label("c", (A+B)/2, S*labelscalefactor);


