% Boundary conditions for beam bending problem based on L = 16, set of
% structed mesh.  This file is for 4 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*81) = -7/128;
force(2*82) = -17/64;
force(2*83) = -23/64;
force(2*84) = -17/64;
force(2*85) = -7/128;

% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(2*1-1) = 1;    % Upper corner
ifix(2*3-1) = 1;    % Center
ifix(2*5-1) = 1;    % Lower corner

% y fixed displacements

ifix(2*3) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1) = 7/128;
force(2*2) = 17/64;
force(2*4) = 17/64;
force(2*5) = 7/128;

% x-forces to assure linear distribution of stresses

force(2*2-1) = -3.0;
force(2*4-1) =  3.0;
