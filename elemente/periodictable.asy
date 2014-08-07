/*
  \title{Periodic table}
  \author{Boris Süssmann}
  
  This work is licensed under the Creative Commons
  Attribution-ShareAlike 3.0 Unported License. To view a copy of this license,
  visit http://creativecommons.org/licenses/by-sa/3.0/deed.en_US.
*/

import unicode;
import babel;
babel("german");

usepackage("amsmath");
usepackage("cmbright");
usepackage("siunitx");

pen dps = linewidth(0.3) + fontsize(10); 
defaultpen(dps);

pen symbolps = fontsize(20);
pen tinyps = fontsize(10);

real w = 3.0cm;
real h = -3.4cm;


label("\includegraphics[height=0.7cm]{by-sa} B.Süssmann, \selectlanguage{german}\today", (1*w, 11.3*h), NE);
label("Quellen: GSI Helmholtzzentrum: \textsl{Periodensystem der Elemente}, Mai 2011, Europa-Lehrmittel: \textsl{Das Periodensystem der Elemente}, Merck: \textsl{EMD PTE}, v1.2.4.1, Wikipedia DE,EN,FR (abgerufen am 2014-04-14)", (19*w, 11.3*h), NW);

pen alkaliMetal = deepcyan;
pen alkalineEarthMetal = heavycyan;
pen nonMetal = mediumred;
pen halogen = lightred;
pen nobleGas = palered;
pen transitionMetal = royalblue;
pen lanthanoid = lightblue;
pen actinoid = paleblue;
pen metalloid = palemagenta;
pen otherMetal = lightmagenta;
pen unknownChemicalProperties = lightgrey;


void draw_element(real x, real y, string symbol, string atomicNumber, string name, string atomicMass, string melt, string boil, string density, string electronConfiguration, string negativity, string oxidation, pen fillpen=white, pen drawpen=black) {
  
  filldraw((x*w,y*h)--((x+1)*w,y*h)--((x+1)*w,(y+1)*h)--(x*w,(y+1)*h)--cycle, fillpen, drawpen);
  label("\textbf{"+atomicNumber+"}", (x*w, y*h), SE, tinyps);
  label(atomicMass, ((x+1)*w, y*h), SW, tinyps);
  label("\textbf{"+symbol+"}", ((x+0.5)*w, (y+0.25)*h), symbolps);
  label(name, ((x+0.5)*w, (y+0.45)*h), tinyps);

  label(boil, (x*w, (y+0.6)*h), E, tinyps);
  label(melt, (x*w, (y+0.7)*h), E, tinyps);
  label(density, (x*w, (y+0.8)*h), E, tinyps);

  label(negativity, ((x+1)*w, (y+0.7)*h), W, tinyps);
  label(oxidation, ((x+1)*w, (y+0.8)*h), W, tinyps);
  //label(density, ((x+1)*w, (y+0.8)*h), W, tinyps);

  label(electronConfiguration, ((x+0.5)*w, (y+1)*h), N, tinyps);
}

void draw_symbols(real x, real y,  string symbol, string atomicNumber, string name, string atomicMass, string melt, string boil, string density, string electronConfiguration, string negativity, string oxidation, pen fillpen=white, pen drawpen=black) {
  real d = 0.1;
  draw_element(x, y, symbol, atomicNumber, name, atomicMass, melt, boil, density, electronConfiguration, negativity, oxidation, fillpen, drawpen);
  
  label("Ordnungszahl", ((x-d)*w, y*h), SW, tinyps);
  label("Relative Atommasse", ((x+1+d)*w, y*h), SE, tinyps);
  label("Symbol", ((x-d)*w, (y+0.25)*h), W, symbolps);
  label("Element", ((x-d)*w, (y+0.45)*h), W, tinyps);

  label("Siedepunkt in \SI{}{\celsius}", ((x-d)*w, (y+0.6)*h), W, tinyps);
  label("Schmelzpunkt in \SI{}{\celsius}", ((x-d)*w, (y+0.7)*h), W, tinyps);
  label("Dichte in \SI{}{\gram\per\centi\meter\cubed}", ((x-d)*w, (y+0.8)*h), W, tinyps);

  label("Elektronegativitat (Pauling)", ((x+1+d)*w, (y+0.7)*h), E, tinyps);
  label("Oxidationsstufen", ((x+1+d)*w, (y+0.8)*h), E, tinyps);
  //label(density, ((x+1)*w, (y+0.8)*h), W, tinyps);

  label("Elektronenkonfiguration", ((x+0.5)*w, (y+1+d)*h), S, tinyps);

  if (fillpen != invisible) {
    real xl = x + 3;
    real yl = y;
    real yf = 1/7;
    real s = -h*yf;
    path box = (0,0)--(s,0)--(s,-s)--(0,-s)--cycle;

    filldraw(shift(xl*w, yl*h) * box, alkaliMetal);
    label("Alkalimetalle", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, alkalineEarthMetal); 
    label("Erdalkalimetalle", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, transitionMetal); 
    label("Übergangsmetalle", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, lanthanoid); 
    label("Lanthanoide", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, actinoid); 
    label("Actinoide", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, otherMetal); 
    label("Andere Metalle", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, metalloid); 
    label("Halbmetalle", (xl*w+s, yl*h-s/2), E);

    xl += 1.3;
    yl = y;

    filldraw(shift(xl*w, yl*h) * box, nonMetal);
    label("Nichtmetalle", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, halogen); 
    label("Halogene", (xl*w+s, yl*h-s/2), E);
    yl += yf;
    filldraw(shift(xl*w, yl*h) * box, nobleGas); 
    label("Edelgase", (xl*w+s, yl*h-s/2), E);
    yl += 2*yf;
    filldraw(shift(xl*w, yl*h) * box, unknownChemicalProperties); 
    label("unbekannte chemische Eigenschaften", (xl*w+s, yl*h-s/2), E);
  } 
}



string oldGroups[] = {"I", "II", "IIIa", "IVa", "Va", "VIa", "VIIa",
 "VIIIa", "VIIIa", "VIIIa", "Ia", "IIa", "III", "IV", "V", "VI", "VII", "VIII"};
for(int i = 1; i <= 18; i = i+1) {
  label(string(i), ((i+0.5)*w, 0.7*h), N, symbolps);
  label(oldGroups[i-1], ((i+0.5)*w, 1*h), N, symbolps);
}
label("\textbf{Gruppe}", (9.5*w, 0.5*h), N, symbolps);

for(int i = 1; i <= 7; i = i+1) {
  label(string(i), (1*w, (i+0.5)*h), W, symbolps);
}
label(rotate(90)*"\textbf{Periode}", (0.7*w, 4.5*h), W, symbolps);

draw_element(3, 6, "", "57-71", "Lanthanoide", "", "", "", "", "", "", "", lanthanoid);
draw_element(3, 7, "", "89-103", "Actinoide", "", "", "", "", "", "", "", actinoid);
label("Lanthanoide", (3*w, 9.5*h), W, symbolps);
label("Actinoide", (3*w, 10.5*h), W, symbolps);
draw_symbols(5, 2, "Fe", "26", "Eisen", "\SI{55.85}{}", "\SI{2861}{}", "\SI{1538}{}", "\SI{7.874}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{6}$", "\SI{1.83}{}", "$\text{2},\textbf{3}$", transitionMetal, black);
draw((3.5*w, 8*h)--(3.5*w, 9*h), linewidth(1), Arrow);
draw_element(1, 1, "H", "1", "Wasserstoff", "\SI{1.008}{}", "\SI{-252.87}{}", "\SI{-259.14}{}", "\SI{0.0889}{}", "$1\text{s}^{1}$", "\SI{2.20}{}", "$\textbf{1}$", nonMetal, black);
draw_element(18, 1, "He", "2", "Helium", "\SI{4.00}{}", "\SI{-268.93}{}", "\SI{-272.2}{}", "\SI{0.1785}{}", "$1\text{s}^{2}$", "\SI{0}{}", "$\text{0}$", nobleGas, black);
draw_element(1, 2, "Li", "3", "Lithium", "\SI{6.94}{}", "\SI{1342}{}", "\SI{180.54}{}", "\SI{0.534}{}", "$\left[\text{He}\right]$$2\text{s}^{1}$", "\SI{0.98}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 2, "Be", "4", "Beryllium", "\SI{9.01}{}", "\SI{2469}{}", "\SI{1287}{}", "\SI{1.85}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$", "\SI{1.57}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(13, 2, "B", "5", "Bor", "\SI{10.81}{}", "\SI{3927}{}", "\SI{2075}{}", "\SI{2.34}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{1}$", "\SI{2.04}{}", "$\textbf{3}$", metalloid, black);
draw_element(14, 2, "C", "6", "Kohlenstoff", "\SI{12.01}{}", "\SI{4827}{}", "\SI{3550}{}", "\SI{2.267}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{2}$", "\SI{2.55}{}", "$\textbf{4}$", nonMetal, black);
draw_element(15, 2, "N", "7", "Stickstoff", "\SI{14.01}{}", "\SI{-195.8}{}", "\SI{-210}{}", "\SI{1.251}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{3}$", "\SI{3.04}{}", "$\textbf{-3},\text{2},\text{3},\text{4},\text{5}$", nonMetal, black);
draw_element(16, 2, "O", "8", "Sauerstoff", "\SI{16.00}{}", "\SI{-182.96}{}", "\SI{-218.79}{}", "\SI{1.4289}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{4}$", "\SI{3.44}{}", "$\textbf{-2}$", nonMetal, black);
draw_element(17, 2, "F", "9", "Fluor", "\SI{19.00}{}", "\SI{-188.12}{}", "\SI{-219.62}{}", "\SI{1.696}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{5}$", "\SI{3.96}{}", "$\textbf{-1}$", halogen, black);
draw_element(18, 2, "Ne", "10", "Neon", "\SI{20.18}{}", "\SI{-246.08}{}", "\SI{-248.59}{}", "\SI{0.8999}{}", "$\left[\text{He}\right]$$2\text{s}^{2}$$2\text{p}^{6}$", "\SI{0}{}", "$\text{0}$", nobleGas, black);
draw_element(1, 3, "Na", "11", "Natrium", "\SI{22.99}{}", "\SI{883}{}", "\SI{97.72}{}", "\SI{0.971}{}", "$\left[\text{Ne}\right]$$3\text{s}^{1}$", "\SI{0.93}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 3, "Mg", "12", "Magnesium", "\SI{24.31}{}", "\SI{1090}{}", "\SI{650}{}", "\SI{1.745}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$", "\SI{1.31}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(13, 3, "Al", "13", "Aluminium", "\SI{26.98}{}", "\SI{2519}{}", "\SI{660.32}{}", "\SI{2.70}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{1}$", "\SI{1.61}{}", "$\textbf{3}$", otherMetal, black);
draw_element(14, 3, "Si", "14", "Silicium", "\SI{28.09}{}", "\SI{3265}{}", "\SI{1414}{}", "\SI{2.33}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{2}$", "\SI{1.9}{}", "$\textbf{4}$", metalloid, black);
draw_element(15, 3, "P", "15", "Phosphor", "\SI{30.97}{}", "\SI{277}{}", "\SI{44.15}{}", "\SI{1.82}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{3}$", "\SI{2.19}{}", "$\text{-3},\text{3},\textbf{5}$", nonMetal, black);
draw_element(16, 3, "S", "16", "Schwefel", "\SI{32.07}{}", "\SI{444.6}{}", "\SI{115.21}{}", "\SI{2.07}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{4}$", "\SI{2.58}{}", "$\text{-2},\text{2},\text{4},\textbf{6}$", nonMetal, black);
draw_element(17, 3, "Cl", "17", "Chlor", "\SI{35.45}{}", "\SI{-34.04}{}", "\SI{-101.5}{}", "\SI{3.214}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{5}$", "\SI{3.16}{}", "$\textbf{-1},\text{1},\text{3},\text{5},\text{7}$", halogen, black);
draw_element(18, 3, "Ar", "18", "Argon", "\SI{39.95}{}", "\SI{-185.85}{}", "\SI{-189.35}{}", "\SI{1.784}{}", "$\left[\text{Ne}\right]$$3\text{s}^{2}$$3\text{p}^{6}$", "\SI{0}{}", "$\text{0}$", nobleGas, black);
draw_element(1, 4, "K", "19", "Kalium", "\SI{39.10}{}", "\SI{759}{}", "\SI{63.38}{}", "\SI{0.862}{}", "$\left[\text{Ar}\right]$$4\text{s}^{1}$", "\SI{0.82}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 4, "Ca", "20", "Calcium", "\SI{40.08}{}", "\SI{1484}{}", "\SI{842}{}", "\SI{1.53}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$", "\SI{1.00}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(3, 4, "Sc", "21", "Scandium", "\SI{44.96}{}", "\SI{2836}{}", "\SI{1541}{}", "\SI{2.99}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{1}$", "\SI{1.36}{}", "$\textbf{3}$", transitionMetal, black);
draw_element(4, 4, "Ti", "22", "Titan", "\SI{47.87}{}", "\SI{3287}{}", "\SI{1668}{}", "\SI{4.51}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{2}$", "\SI{1.54}{}", "$\text{3},\textbf{4}$", transitionMetal, black);
draw_element(5, 4, "V", "23", "Vanadium", "\SI{50.94}{}", "\SI{3407}{}", "\SI{1910}{}", "\SI{6.12}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{3}$", "\SI{1.63}{}", "$\text{2},\text{3},\text{4},\textbf{5}$", transitionMetal, black);
draw_element(6, 4, "Cr", "24", "Chrom", "\SI{52.00}{}", "\SI{2671}{}", "\SI{1970}{}", "\SI{7.19}{}", "$\left[\text{Ar}\right]$$4\text{s}^{1}$$3\text{d}^{5}$", "\SI{1.66}{}", "$\text{2},\textbf{3},\text{6}$", transitionMetal, black);
draw_element(7, 4, "Mn", "25", "Mangan", "\SI{54.94}{}", "\SI{2061}{}", "\SI{1246}{}", "\SI{7.34}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{5}$", "\SI{1.55}{}", "$\textbf{2},\text{3},\text{4},\text{6},\text{7}$", transitionMetal, black);
draw_element(8, 4, "Fe", "26", "Eisen", "\SI{55.85}{}", "\SI{2861}{}", "\SI{1538}{}", "\SI{7.874}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{6}$", "\SI{1.83}{}", "$\text{2},\textbf{3}$", transitionMetal, black);
draw_element(9, 4, "Co", "27", "Cobalt", "\SI{58.93}{}", "\SI{2927}{}", "\SI{1495}{}", "\SI{8.90}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{7}$", "\SI{1.88}{}", "$\textbf{2},\text{3}$", transitionMetal, black);
draw_element(10, 4, "Ni", "28", "Nickel", "\SI{58.69}{}", "\SI{2913}{}", "\SI{1455}{}", "\SI{8.90}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{8}$", "\SI{1.91}{}", "$\textbf{2},\text{3}$", transitionMetal, black);
draw_element(11, 4, "Cu", "29", "Kupfer", "\SI{63.55}{}", "\SI{2562}{}", "\SI{1084.62}{}", "\SI{8.94}{}", "$\left[\text{Ar}\right]$$4\text{s}^{1}$$3\text{d}^{10}$", "\SI{1.90}{}", "$\text{1},\textbf{2}$", transitionMetal, black);
draw_element(12, 4, "Zn", "30", "Zink", "\SI{65.41}{}", "\SI{907}{}", "\SI{419.53}{}", "\SI{7.13}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$", "\SI{1.65}{}", "$\textbf{2}$", transitionMetal, black);
draw_element(13, 4, "Ga", "31", "Gallium", "\SI{69.72}{}", "\SI{2204}{}", "\SI{29.76}{}", "\SI{5.904}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{1}$", "\SI{1.81}{}", "$\textbf{3}$", otherMetal, black);
draw_element(14, 4, "Ge", "32", "Germanium", "\SI{72.64}{}", "\SI{2833}{}", "\SI{938.25}{}", "\SI{5.32}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{2}$", "\SI{2.01}{}", "$\textbf{4}$", metalloid, black);
draw_element(15, 4, "As", "33", "Arsen", "\SI{74.92}{}", "\SI{615}{}", "\SI{615}{}", "\SI{5.73}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{3}$", "\SI{2.18}{}", "$\text{-3},\textbf{3},\text{5}$", metalloid, black);
draw_element(16, 4, "Se", "34", "Selen", "\SI{78.96}{}", "\SI{685}{}", "\SI{221}{}", "\SI{4.81}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{4}$", "\SI{2.55}{}", "$\text{-2},\textbf{4},\text{6}$", nonMetal, black);
draw_element(17, 4, "Br", "35", "Brom", "\SI{79.90}{}", "\SI{58.8}{}", "\SI{-7.3}{}", "\SI{3.12}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{5}$", "\SI{2.96}{}", "$\textbf{-1},\text{1},\text{3},\text{5},\text{7}$", halogen, black);
draw_element(18, 4, "Kr", "36", "Krypton", "\SI{83.80}{}", "\SI{-153.22}{}", "\SI{-157.36}{}", "\SI{3.733}{}", "$\left[\text{Ar}\right]$$4\text{s}^{2}$$3\text{d}^{10}$$4\text{p}^{6}$", "\SI{0}{}", "$\text{0}$", nobleGas, black);
draw_element(1, 5, "Rb", "37", "Rubidium", "\SI{85.47}{}", "\SI{688}{}", "\SI{39.31}{}", "\SI{1.53}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$", "\SI{0.82}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 5, "Sr", "38", "Strontium", "\SI{87.62}{}", "\SI{1382}{}", "\SI{777}{}", "\SI{2.67}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$", "\SI{0.95}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(3, 5, "Y", "39", "Yttrium", "\SI{88.91}{}", "\SI{3336}{}", "\SI{1526}{}", "\SI{4.47}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{1}$", "\SI{1.22}{}", "$\textbf{3}$", transitionMetal, black);
draw_element(4, 5, "Zr", "40", "Zirconium", "\SI{91.22}{}", "\SI{4409}{}", "\SI{1855}{}", "\SI{6.50}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{2}$", "\SI{1.33}{}", "$\textbf{4}$", transitionMetal, black);
draw_element(5, 5, "Nb", "41", "Niob", "\SI{92.91}{}", "\SI{4744}{}", "\SI{2477}{}", "\SI{8.58}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$$4\text{d}^{4}$", "\SI{1.60}{}", "$\text{3},\textbf{5}$", transitionMetal, black);
draw_element(6, 5, "Mo", "42", "Molybdän", "\SI{95.94}{}", "\SI{4639}{}", "\SI{2623}{}", "\SI{10.22}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$$4\text{d}^{5}$", "\SI{2.16}{}", "$\text{2},\text{3},\text{4},\text{5},\textbf{6}$", transitionMetal, black);
draw_element(7, 5, "Tc", "43", "Technetium", "\SI{97.91}{}", "\SI{4265}{}", "\SI{2157}{}", "\SI{11.5}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{5}$", "\SI{1.90}{}", "$\textbf{7}$", transitionMetal, black);
draw_element(8, 5, "Ru", "44", "Ruthenium", "\SI{101.07}{}", "\SI{4150}{}", "\SI{2334}{}", "\SI{12.30}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$$4\text{d}^{7}$", "\SI{2.20}{}", "$\text{3},\textbf{4},\text{6}$", transitionMetal, black);
draw_element(9, 5, "Rh", "45", "Rhodium", "\SI{102.91}{}", "\SI{3695}{}", "\SI{1964}{}", "\SI{12.41}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$$4\text{d}^{8}$", "\SI{2.28}{}", "$\textbf{3},\text{4}$", transitionMetal, black);
draw_element(10, 5, "Pd", "46", "Palladium", "\SI{106.42}{}", "\SI{2963}{}", "\SI{1554.9}{}", "\SI{12.02}{}", "$\left[\text{Kr}\right]$$5\text{s}^{0}$$4\text{d}^{10}$", "\SI{2.20}{}", "$\textbf{2},\text{4}$", transitionMetal, black);
draw_element(11, 5, "Ag", "47", "Silber", "\SI{107.87}{}", "\SI{2162}{}", "\SI{951.78}{}", "\SI{10.50}{}", "$\left[\text{Kr}\right]$$5\text{s}^{1}$$4\text{d}^{10}$", "\SI{1.93}{}", "$\textbf{1},\textbf{2}$", transitionMetal, black);
draw_element(12, 5, "Cd", "48", "Cadmium", "\SI{112.41}{}", "\SI{767}{}", "\SI{321.07}{}", "\SI{8.65}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$", "\SI{1.69}{}", "$\textbf{2}$", transitionMetal, black);
draw_element(13, 5, "In", "49", "Indium", "\SI{114.82}{}", "\SI{2072}{}", "\SI{156.6}{}", "\SI{7.30}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{1}$", "\SI{1.78}{}", "$\textbf{3}$", otherMetal, black);
draw_element(14, 5, "Sn", "50", "Zinn", "\SI{118.71}{}", "\SI{2602}{}", "\SI{231.93}{}", "\SI{7.29}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{2}$", "\SI{1.96}{}", "$\textbf{2},\textbf{4}$", otherMetal, black);
draw_element(15, 5, "Sb", "51", "Antimon", "\SI{121.76}{}", "\SI{1587}{}", "\SI{630.63}{}", "\SI{6.69}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{3}$", "\SI{2.07}{}", "$\text{-3},\textbf{3},\text{5}$", metalloid, black);
draw_element(16, 5, "Te", "52", "Tellur", "\SI{127.60}{}", "\SI{988}{}", "\SI{449.51}{}", "\SI{6.25}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{4}$", "\SI{2.10}{}", "$\text{-2},\textbf{4},\text{6}$", metalloid, black);
draw_element(17, 5, "I", "53", "Iod", "\SI{126.90}{}", "\SI{184.3}{}", "\SI{113.7}{}", "\SI{4.93}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{5}$", "\SI{2.66}{}", "$\textbf{-1},\text{1},\text{3},\text{5},\text{7}$", halogen, black);
draw_element(18, 5, "Xe", "54", "Xenon", "\SI{131.29}{}", "\SI{-108.12}{}", "\SI{-111.7}{}", "\SI{5.897}{}", "$\left[\text{Kr}\right]$$5\text{s}^{2}$$4\text{d}^{10}$$5\text{p}^{6}$", "\SI{0}{}", "$\textbf{2},\text{4},\text{6}$", nobleGas, black);
draw_element(1, 6, "Cs", "55", "Caesium", "\SI{132.91}{}", "\SI{671}{}", "\SI{28.44}{}", "\SI{1.90}{}", "$\left[\text{Xe}\right]$$6\text{s}^{1}$", "\SI{0.79}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 6, "Ba", "56", "Barium", "\SI{137.33}{}", "\SI{1897}{}", "\SI{727}{}", "\SI{3.733}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$", "\SI{0.89}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(3, 9, "La", "57", "Lanthan", "\SI{138.91}{}", "\SI{3464}{}", "\SI{920}{}", "\SI{6.16}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{0}$$5\text{d}^{1}$", "\SI{1.10}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(4, 9, "Ce", "58", "Cer", "\SI{140.12}{}", "\SI{3443}{}", "\SI{795}{}", "\SI{6.67}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{2}$", "\SI{1.12}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(5, 9, "Pr", "59", "Praseodym", "\SI{140.91}{}", "\SI{3520}{}", "\SI{935}{}", "\SI{6.77}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{3}$", "\SI{1.13}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(6, 9, "Nd", "60", "Neodym", "\SI{144.24}{}", "\SI{3074}{}", "\SI{1024}{}", "\SI{7.00}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{4}$", "\SI{1.14}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(7, 9, "Pm", "61", "Promethium", "\SI{144.91}{}", "\SI{3000}{}", "\SI{1042}{}", "\SI{7.2}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{5}$", "\SI{1.13}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(8, 9, "Sm", "62", "Samarium", "\SI{150.36}{}", "\SI{1794}{}", "\SI{1072}{}", "\SI{7.54}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{6}$", "\SI{1.17}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(9, 9, "Eu", "63", "Europium", "\SI{151.96}{}", "\SI{1529}{}", "\SI{826}{}", "\SI{5.26}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{7}$", "\SI{1.2}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(10, 9, "Gd", "64", "Gadolinium", "\SI{157.25}{}", "\SI{3273}{}", "\SI{1312}{}", "\SI{7.89}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{7}$$5\text{d}^{1}$", "\SI{1.2}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(11, 9, "Tb", "65", "Terbium", "\SI{158.93}{}", "\SI{3230}{}", "\SI{1356}{}", "\SI{8.253}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{9}$", "\SI{1.1}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(12, 9, "Dy", "66", "Dysprosium", "\SI{162.50}{}", "\SI{2567}{}", "\SI{1407}{}", "\SI{8.56}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{10}$", "\SI{1.22}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(13, 9, "Ho", "67", "Holmium", "\SI{164.93}{}", "\SI{2720}{}", "\SI{1461}{}", "\SI{8.80}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{11}$", "\SI{1.23}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(14, 9, "Er", "68", "Erbium", "\SI{167.26}{}", "\SI{2868}{}", "\SI{1529}{}", "\SI{9.16}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{12}$", "\SI{1.24}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(15, 9, "Tm", "69", "Thulium", "\SI{168.93}{}", "\SI{1950}{}", "\SI{1545}{}", "\SI{9.32}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{13}$", "\SI{1.25}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(16, 9, "Yb", "70", "Ytterbium", "\SI{173.04}{}", "\SI{1196}{}", "\SI{824}{}", "\SI{6.96}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$", "\SI{1.1}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(17, 9, "Lu", "71", "Lutetium", "\SI{174.97}{}", "\SI{3402}{}", "\SI{1652}{}", "\SI{9.84}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{1}$", "\SI{1.27}{}", "$\textbf{3}$", lanthanoid, black);
draw_element(4, 6, "Hf", "72", "Hafnium", "\SI{178.49}{}", "\SI{4603}{}", "\SI{2233}{}", "\SI{13.31}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{2}$", "\SI{1.30}{}", "$\textbf{4}$", transitionMetal, black);
draw_element(5, 6, "Ta", "73", "Tantal", "\SI{180.95}{}", "\SI{5458}{}", "\SI{3017}{}", "\SI{16.60}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{3}$", "\SI{1.50}{}", "$\textbf{5}$", transitionMetal, black);
draw_element(6, 6, "W", "74", "Wolfram", "\SI{183.84}{}", "\SI{5555}{}", "\SI{3422}{}", "\SI{19.27}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{4}$", "\SI{2.36}{}", "$\text{2},\text{3},\text{4},\text{5},\textbf{6}$", transitionMetal, black);
draw_element(7, 6, "Re", "75", "Rhenium", "\SI{186.21}{}", "\SI{5596}{}", "\SI{3186}{}", "\SI{21.04}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{5}$", "\SI{1.90}{}", "$\text{2},\text{4},\text{6},\textbf{7}$", transitionMetal, black);
draw_element(8, 6, "Os", "76", "Osmium", "\SI{190.23}{}", "\SI{5012}{}", "\SI{3033}{}", "\SI{22.48}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{6}$", "\SI{2.20}{}", "$\text{2},\text{3},\textbf{4},\text{6},\text{8}$", transitionMetal, black);
draw_element(9, 6, "Ir", "77", "Iridium", "\SI{192.22}{}", "\SI{4428}{}", "\SI{2446}{}", "\SI{22.42}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{7}$", "\SI{2.20}{}", "$\text{2},\text{3},\textbf{4},\text{6}$", transitionMetal, black);
draw_element(10, 6, "Pt", "78", "Platin", "\SI{195.08}{}", "\SI{3825}{}", "\SI{1768.3}{}", "\SI{21.46}{}", "$\left[\text{Xe}\right]$$6\text{s}^{1}$$4\text{f}^{14}$$5\text{d}^{9}$", "\SI{2.20}{}", "$\textbf{2},\text{4}$", transitionMetal, black);
draw_element(11, 6, "Au", "79", "Gold", "\SI{196.97}{}", "\SI{2856}{}", "\SI{1064}{}", "\SI{19.32}{}", "$\left[\text{Xe}\right]$$6\text{s}^{1}$$4\text{f}^{14}$$5\text{d}^{10}$", "\SI{2.40}{}", "$\text{1},\textbf{3}$", transitionMetal, black);
draw_element(12, 6, "Hg", "80", "Quecksilber", "\SI{200.59}{}", "\SI{356.73}{}", "\SI{-38.83}{}", "\SI{13.59}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$", "\SI{1.90}{}", "$\text{1},\textbf{2}$", transitionMetal, black);
draw_element(13, 6, "Tl", "81", "Thallium", "\SI{204.38}{}", "\SI{1473}{}", "\SI{304}{}", "\SI{11.85}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{1}$", "\SI{1.80}{}", "$\textbf{1},\text{3}$", otherMetal, black);
draw_element(14, 6, "Pb", "82", "Blei", "\SI{207.2}{}", "\SI{1749}{}", "\SI{327.46}{}", "\SI{11.35}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{2}$", "\SI{1.8}{}", "$\textbf{2},\text{4}$", otherMetal, black);
draw_element(15, 6, "Bi", "83", "Bismut", "\SI{208.98}{}", "\SI{1564}{}", "\SI{271.5}{}", "\SI{9.79}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{3}$", "\SI{1.9}{}", "$\textbf{3},\text{5}$", otherMetal, black);
draw_element(16, 6, "Po", "84", "Polonium", "\SI{208.98}{}", "\SI{962}{}", "\SI{254}{}", "", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{4}$", "\SI{2}{}", "$\text{2},\textbf{4},\text{6}$", otherMetal, black);
draw_element(17, 6, "At", "85", "Astat", "\SI{209.99}{}", "\SI{337}{}", "\SI{302}{}", "", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{5}$", "\SI{2.2}{}", "$\textbf{-1},\text{1},\text{3},\text{5},\text{7}$", metalloid, black);
draw_element(18, 6, "Rn", "86", "Radon", "\SI{222.02}{}", "\SI{-61.7}{}", "\SI{-71}{}", "\SI{9.97}{}", "$\left[\text{Xe}\right]$$6\text{s}^{2}$$4\text{f}^{14}$$5\text{d}^{10}$$6\text{p}^{6}$", "\SI{0}{}", "$\text{0}$", nobleGas, black);
draw_element(1, 7, "Fr", "87", "Francium", "\SI{223.02}{}", "\SI{677}{}", "\SI{271.5}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{1}$", "\SI{0.70}{}", "$\textbf{1}$", alkaliMetal, black);
draw_element(2, 7, "Ra", "88", "Radium", "\SI{226.03}{}", "\SI{1737}{}", "\SI{700}{}", "\SI{5.5}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$", "\SI{0.90}{}", "$\textbf{2}$", alkalineEarthMetal, black);
draw_element(3, 10, "Ac", "89", "Actinium", "\SI{227.03}{}", "\SI{3198}{}", "\SI{1050}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{0}$$6\text{d}^{1}$", "\SI{1.10}{}", "$\textbf{3}$", actinoid, black);
draw_element(4, 10, "Th", "90", "Thorium", "\SI{232.04}{}", "\SI{4788}{}", "\SI{19842}{}", "\SI{11.7}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{0}$$6\text{d}^{2}$", "\SI{1.3}{}", "$\textbf{4}$", actinoid, black);
draw_element(5, 10, "Pa", "91", "Protactinium", "\SI{231.04}{}", "\SI{4027}{}", "\SI{1568}{}", "\SI{15.37}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{2}$$6\text{d}^{1}$", "\SI{1.5}{}", "$\textbf{5}$", actinoid, black);
draw_element(6, 10, "U", "92", "Uran", "\SI{238.03}{}", "\SI{4131}{}", "\SI{1132}{}", "\SI{19.1}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{3}$$6\text{d}^{1}$", "\SI{1.7}{}", "$\textbf{6}$", actinoid, black);
draw_element(7, 10, "Np", "93", "Neptunium", "\SI{237.05}{}", "\SI{4000}{}", "\SI{644}{}", "\SI{20.45}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{4}$$6\text{d}^{1}$", "\SI{1.3}{}", "$\textbf{5}$", actinoid, black);
draw_element(8, 10, "Pu", "94", "Plutonium", "\SI{244.06}{}", "\SI{3228}{}", "\SI{639.4}{}", "\SI{19.81}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{6}$", "\SI{1.28}{}", "$\textbf{4}$", actinoid, black);
draw_element(9, 10, "Am", "95", "Americium", "\SI{243.06}{}", "\SI{2607}{}", "\SI{1176}{}", "\SI{13.67}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{7}$", "\SI{1.13}{}", "$\textbf{3}$", actinoid, black);
draw_element(10, 10, "Cm", "96", "Curium", "\SI{247.07}{}", "\SI{3110}{}", "\SI{1340}{}", "\SI{13.59}{}", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{7}$$6\text{d}^{1}$", "\SI{1.28}{}", "$\textbf{3}$", actinoid, black);
draw_element(11, 10, "Bk", "97", "Berkelium", "\SI{247.07}{}", "", "\SI{1050}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{9}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(12, 10, "Cf", "98", "Californium", "\SI{251.08}{}", "", "\SI{900}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{10}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(13, 10, "Es", "99", "Einsteinium", "\SI{252.08}{}", "", "\SI{860}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{11}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(14, 10, "Fm", "100", "Fermium", "\SI{257.1}{}", "", "\SI{1527}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{12}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(15, 10, "Md", "101", "Mendelevium", "\SI{258.10}{}", "", "\SI{827}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{13}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(16, 10, "No", "102", "Nobelium", "\SI{259.10}{}", "", "\SI{827}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{14}$", "\SI{1.3}{}", "$\textbf{2}$", actinoid, black);
draw_element(17, 10, "Lr", "103", "Lawrencium", "\SI{262.11}{}", "", "\SI{1627}{}", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{14}$$6\text{d}^{1}$", "\SI{1.3}{}", "$\textbf{3}$", actinoid, black);
draw_element(4, 7, "Rf", "104", "Rutherfordium", "\SI{261.11}{}", "", "", "", "$\left[\text{Rn}\right]$$7\text{s}^{2}$$5\text{f}^{14}$$6\text{d}^{2}$", "\SI{0}{}", "", transitionMetal, black);
draw_element(5, 7, "Db", "105", "Dubnium", "\SI{262.11}{}", "", "", "", "", "\SI{0}{}", "", transitionMetal, black);
draw_element(6, 7, "Sg", "106", "Seaborgium", "\SI{266.12}{}", "", "", "", "", "\SI{0}{}", "", transitionMetal, black);
draw_element(7, 7, "Bh", "107", "Bohrium", "\SI{264.12}{}", "", "", "", "", "\SI{0}{}", "", transitionMetal, black);
draw_element(8, 7, "Hs", "108", "Hassium", "\SI{277}{}", "", "", "", "", "\SI{0}{}", "", transitionMetal, black);
draw_element(9, 7, "Mt", "109", "Meitnerium", "\SI{268.14}{}", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(10, 7, "Ds", "110", "Darmstadtium", "\SI{281}{}", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(11, 7, "Rg", "111", "Roentgenium", "\SI{280}{}", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(12, 7, "Cn", "112", "Copernicium", "\SI{285}{}", "", "", "", "", "\SI{0}{}", "", transitionMetal, black);
draw_element(13, 7, "Uut", "113", "Ununtrium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(14, 7, "Fl", "114", "Flerovium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(15, 7, "Uup", "115", "Ununpentium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(16, 7, "Lv", "116", "Livermorium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(17, 7, "Uus", "117", "Ununseptium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
draw_element(18, 7, "Uuo", "118", "Ununoctium", "", "", "", "", "", "\SI{0}{}", "", unknownChemicalProperties, black);
