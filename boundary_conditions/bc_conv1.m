% Boundary conditions for beam bending problem based on L = 16, set of
% structed mesh.  This file is for 2 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*25) = -3/16;
force(2*26) = -5/8;
force(2*27) = -3/16;

% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1) = 1;
ifix(1,2) = 1;
ifix(1,3) = 1;

% y fixed displacements

ifix(2,2) = 1;

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1) = 3/16;
force(2*3) = 3/16;

% x-forces to assure linear distribution of stresses

% empty
