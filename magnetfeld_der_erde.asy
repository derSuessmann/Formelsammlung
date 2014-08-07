/*
  \title{Abbildung Magnetfeld der Erde}
  \author{Boris Süssmann}
  
  This work is licensed under the Creative Commons
  Attribution-ShareAlike 3.0 Unported License. To view a copy of this license,
  visit http://creativecommons.org/licenses/by-sa/3.0/deed.en_US.
*/

import graph;
usepackage("amsmath");
usepackage("cmbright");

size(5cm); 
real labelscalefactor = 0.5; /* changes label-to-point distance */
pen dps = linewidth(0.7) + fontsize(12); defaultpen(dps); /* default pen style */

real w = 1, h=1.5*w;
real x0 = 0, y0 = 0;
real angle_radius = 0.2;
real xmin = x0-2,
     xmax = x0+w+2,
     ymin = y0-2,
     ymax = y0+h+2;  /* image dimensions */
pen color_angle = rgb(0.0,0.4,0.0); 

draw(arc((x0+w,y0+h),angle_radius,180.0,236.3099324740205)--(x0+w,y0+h)--cycle, color_angle); 
draw((x0+w,y0+h)--(x0,y0+h),EndArrow(6)); 
draw((x0+w,y0+h)--(x0+w,y0),EndArrow(6)); 
draw((x0+w,y0+h)--(x0,y0),EndArrow(6)); 
draw((x0,y0)--(x0+w,y0), linetype("2 2")); 
draw((x0,y0)--(x0,y0+h), linetype("2 2")); 
label("$\cos i = \frac{B_h}{B}$",(x0+w/3,y0+h*2/3)); 
label("$B_h$", (x0+w/2,y0+h), N * labelscalefactor); 
label("$B_v$", (x0+w,y0+h/2), E * labelscalefactor); 
label("$B$", (x0+w/2,y0+h/2), SE * labelscalefactor); 
label("$i$", (x0+w-0.8*angle_radius,y0+h-0.7*angle_radius), NE * labelscalefactor, color_angle); 
clip((xmin,ymin)--(xmin,ymax)--(xmax,ymax)--(xmax,ymin)--cycle); 
