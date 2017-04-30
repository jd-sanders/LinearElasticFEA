% Boundary conditions for beam bending problem based on L = 16, set of
% structed mesh.  This file is for 8 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*289) = -15/1024;
force(2*290) = -41/512;
force(2*291) = -71/512;
force(2*292) = -89/512;
force(2*293) = -95/512;
force(2*294) = -89/512;
force(2*295) = -71/512;
force(2*296) = -41/512;
force(2*297) = -15/1024;

% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(2*1-1) = 1;    % Upper corner
ifix(2*5-1) = 1;    % Center
ifix(2*9-1) = 1;    % Lower corner

% y fixed displacements

ifix(2*5) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1) = 15/1024;
force(2*2) = 41/512;
force(2*3) = 71/512;
force(2*4) = 89/512;
force(2*6) = 89/512;
force(2*7) = 71/512;
force(2*8) = 41/512;
force(2*9) = 15/1024;

% x-forces to assure linear distribution of stresses

force(2*2-1) = -9/4;
force(2*3-1) = -6/4;
force(2*4-1) = -3/4;
force(2*6-1) =  3/4;
force(2*7-1) =  6/4;
force(2*8-1) =  9/4;

