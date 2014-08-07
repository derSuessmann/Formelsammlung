import graph; size(10cm); 
real labelscalefactor = 0.5; /* changes label-to-point distance */
pen dps = linewidth(0.7) + fontsize(12); defaultpen(dps); /* default pen style */ 
pen dotstyle = black; /* point style */ 
real xmin = 1.037112358874920, xmax = 11.18253194288360, ymin = -7.999285079043284, ymax = 5.508818339749686;  /* image dimensions */
pen qqwuqq = rgb(0.000000000000000,0.3921568627450985,0.000000000000000); 

texpreamble("\usepackage{cmbright}");

draw(arc((2.0,5.0),0.8103370274767319,-89.97793096179089,-67.48085200200991)--(2.0,5.0)--cycle, qqwuqq); 
draw(arc((5.063937339784303,-2.390012718383884),0.8103370274767319,-90.0,-67.48085200200991)--(5.063937339784303,-2.390012718383884)--cycle, qqwuqq); 
draw(arc((5.063937339784303,-7.295012718383889),0.8103370274767319,90.00000000000000,112.5191479979903)--(5.063937339784303,-7.295012718383889)--cycle, qqwuqq); 
 /* draw figures */
draw(shift((2.000000000000000,5.000000000000000))*scale(0.1058333333333334)*(expi(pi/4)--expi(5*pi/4)^^expi(3*pi/4)--expi(7*pi/4))); /* special point */
draw((2.000000000000000,5.000000000000000)--(5.063937339784303,-2.390012718383884)); 
draw((2.000000000000000,5.000000000000000)--(2.003081418959802,-2.999999406553556), linetype("2 2")); 
draw((2.002846920022463,-2.391191781228487)--(5.063937339784303,-2.390012718383884), dotted); 
draw((5.063937339784303,-2.390012718383884)--(5.063937339784308,-7.295012718383892),EndArrow(6)); 
draw((5.063937339784303,-2.390012718383884)--(6.799552442191178,-6.576200704169810),EndArrow(6)); 
draw((5.063937339784303,-2.390012718383884)--(3.328322237377439,-3.108824732597969),EndArrow(6)); 
draw((3.328322237377433,-3.108824732597966)--(5.063937339784303,-7.295012718383889), linetype("2 2")); 
draw((5.063937339784303,-7.295012718383889)--(6.799552442191173,-6.576200704169807), linetype("2 2")); 
draw(shift((2.000000000000000,5.000000000000000))*xscale(8.000000000000000)*yscale(8.000000000000000)*arc((0,0),1,270.0220690382095,292.5191479979905), linetype("2 2")); 
 /* dots and labels */
dot((5.063937339784303,-2.390012718383884),linewidth(5.000000000000000pt) + dotstyle); 
label("$\ell$", (3.581570625151858,1.173283350244876), NE * labelscalefactor); 
dot((2.003081418959802,-2.999999406553556),linewidth(5.000000000000000pt) + gray); 
label("$\delta$", (2.0,3.7), NE * labelscalefactor,qqwuqq); 
label("$s_h$", (3.403296479106977,-2.302802125979329), N * labelscalefactor); 
label("$F_G$", (5.1,-5.0), SE * labelscalefactor); 
label("$F$", (5.980168226482984,-4.456441188365847), NE * labelscalefactor); 
label("$F_R$", (4.1,-3.3), NE * labelscalefactor); 
label("$\delta$", (5.1,-3.7), NE * labelscalefactor,qqwuqq); 
label("$\delta$", (4.9,-6.5), N * labelscalefactor,qqwuqq); 
label("$s$", (3.3,-2.8), NE * labelscalefactor); 
clip((xmin,ymin)--(xmin,ymax)--(xmax,ymax)--(xmax,ymin)--cycle); 
 /* end of picture */
