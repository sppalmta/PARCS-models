# NuScale PARCS models

August 2025

This directory includes models of the NuScale US460 design.
This is a public model based off of the NuScale Standard Design Approval (SDA),
which can be found on the NRC website.

This model is not meant to be exact, it is a representative model used to educate Nuclear Engineering students.

** This is an initial model - use at your own risk **

## Highlights

* Each module is 250 MWt and 77 MWe
* Natural circulation PWR
* Pressure 2000 psia
* Inlet temperature 481 F
* Core average temperature 540 F
* 37 fuel assemblies in the core
* Each fuel assembly has 17x17 rods
* Active core height is 94 in (200 cm)
* Gadolinia burnable absorber is used 

Note that the SDA does not include information about the gadolinia loading
or position of the gadolinia rods.  This information is estimated in these models.

## References

Standard Design Approval (SDA)
https://www.nrc.gov/docs/ML2509/ML25099A236.html

SDA Chapter 1 - Introduction
https://www.nrc.gov/docs/ML2509/ML25099A239.pdf

SDA Chapter 4 - Reactor
https://www.nrc.gov/docs/ML2509/ML25099A249.pdf
* Table 4.4-1 is very useful
* Figure 4.3-2: Fuel Loading Pattern for Reference Equilibrium Cycle
* Figure 4.3-3: Shuffle Pattern for Reference Equilibrium Cycle
* Figure 4.3-19: Boron Letdown Curve for Equilibrium Cycle


## Things left to investigate

[ ] 1x1 vs 2x2
[ ] Reflectors are approximate.  Use NuScale specific values.
[ ] Do fuel temperatures need to be updated?
[ ] Investigate case matrix. How important are history models?
[ ] Investigate burnup steps for gad
[ ] Investigate number of rings, etc. for gad


