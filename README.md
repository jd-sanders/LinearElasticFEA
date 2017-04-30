## Finite Element Application for Linear Elasticity
### Jessica Sanders, Duke University, 2010

This is a basic Matlab program for solving the two dimensional
time-independent linear
elasticity equations with finite element analysis. It is set up to run several
examples of beam bending problems, with end-to-end capabilites (meshing,
computing, post-processing).  Think of the beam bending problem as an analysis of a cantilever beam.  Say you hang a weight on the end, how far does it bend, and what internal stresses are developed.  I wrote this as a platform for experiments, prototypes, and extensions to the finite element method.  

An reference for the equations of linear elasticity is

Fundamentals of Structural Mechanics, by Keith Hjelmstad

An excellent reference for the Finite Element Method is 

*The Finite Element Method: Linear Static and Dynamic Finite Element Analysis,
by Thomas J. R. Hughes*

The major steps for setting up an elasticity finite element problem are
generating a domain (and mesh), defining the material properties, applying
boundary conditions, integrating and solving the equations of elasticity, and
processing the results to pull our meaningfull information about the motions
(displacement) and stresses in the domain.  Integration is done over
individual elements, in the case of most of these examples, triangles.  There is also a function that
integrates quadrilateral elements.

The equations can be solved with the assumptions of either plane stress or
plane strain.  Plane stress easticity assumes that there are no out-of-plane stresses -
essentially this would be a very thin plate.  Plane strain elasticity assumes
that there are no out-of-plane strains.  This would suggest that you are
running the analyses on a section of a structure that extends quite a distance
out of the plane in either direction (for example, looking at a slice of an
I-beam).    

The main application file is beam2d.m, and it makes calls to appropriate
routines:


## Section 1: Meshing

To generate a finite element mesh, you can either call a meshing script (for example, "structured", which generates a structured mesh on a rectangular domain), or load a *.mat file, which has the appropriate variables defined.  A finite element mesh for this program would have the following variables:

**numele**:  scalar value: number of elements
**numnod**:  scalar value: number of nodes
**x**:       1xnumnod vector with x-coordinates for every node 
**y**:       1xnumnod vector with y-coordinates for every node
**node**:    3xnumele array with nodal connectivity for each element

The mesh ordering needs to be counter clockwise, and the next section automatically checks and corrects the connectivity array.

## Section 2:  Matieral Constants
This section should generate two array:

**pr**:      1xnumele vector with poissons ratio for every element
**young**:   1xnumele vector with youngs moduls for every element

## Section 3: Boundary Conditions
the Matlab function applycs() produces 2 arrays:

**force**:  1x(2numnod) vector of nodal forces in two dimensions.  
**ifix**:   2xnumnod array of logical variables.  A 1 entry in slot i,j means that node j is fixed in direction i.  

the applybcs() function is currently set up just to set up the variable arrays and then fill them by calling a separate script, depending on the problem.  Some examples of these scripts are bc_conv1.m, etc.  

## Section 4:  Assembly of stiffness

The function elemstiff_class() calculates the local stiffness matrix of a triangle and returns it in the 6x6 array "ke", which is assembles into the global stiffness matrix, "bigk".

## Section 5:  Enforce boundary conditions

This is only set up for fixed nodes, and doesn't treat other displacement degrees of freedom.  It zeros out the row and column of the fixed degree of freedom, puts a one on the diagonal, and zeros the forcing vector in the appropriate slot.  

## Section 6:  Standard linear solve for displacement vecotr

solutions is stored in "disp"

## Section 7:  compute stresses at center of each element

**stress**:  numelex6 array.  In column i:  
                          row 1:  element #
                          row 2:  x-coordinate of center
                          row 3:  y-coordinate of center
                          row 4:  xx stress
                          row 5:  yy stress
                          row 6:  xy stress

The important variables that might comprise a results file are the mesh variables plus "disp" and "stress".  They can be saved into a results file with the command "save output.mat variable1 variable2 variable3 variable4"

## Postprocessing (additional scripts)

There are a few scripts in the directory which can be run from the command line to visualize the results:

postprocess/plotmesh.m
postprocess/showdeform.m
postprocess/xx_stress.m

postprocess/error_norm.m calculates the L2 error norm of the solution, assuming you know the analytical solution and have stored it in analytical.m  Right now it is set up for beam bending.  
 
