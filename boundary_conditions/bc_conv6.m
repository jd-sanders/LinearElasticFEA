% Boundary conditions for beam bending problem based on L = 16, set of
% structed mesh.  This file is for 10 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*441) =  -19/2000;
force(2*442) =  -53/1000;
force(2*443) =  -95/1000;
force(2*444) = -125/1000;
force(2*445) = -143/1000;
force(2*446) = -149/1000;
force(2*447) = -143/1000;
force(2*448) = -125/1000;
force(2*449) =  -95/1000;
force(2*450) =  -53/1000;
force(2*451) =  -19/2000;


% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1)  = 1;    % Upper corner
ifix(1,6)  = 1;    % Center
ifix(1,11) = 1;    % Lower corner

% y fixed displacements

%ifix(2,1) = 1;
ifix(2,6) = 1;    % Center
%ifix(2,11) = 1;

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1)  =  19/2000;
force(2*2)  =  53/1000;
force(2*3)  =  95/1000;
force(2*4)  = 125/1000;
force(2*5)  = 143/1000;
force(2*7)  = 143/1000;
force(2*8)  = 125/1000;
force(2*9)  =  95/1000;
force(2*10) =  53/1000;
force(2*11) =  19/2000;

% x-forces to assure linear distribution of stresses

force(2*2-1)  = -48/25;
force(2*3-1)  = -36/25;
force(2*4-1)  = -24/25;
force(2*5-1)  = -12/25;
force(2*7-1)  =  12/25;
force(2*8-1)  =  24/25;
force(2*9-1)  =  36/25;
force(2*10-1) =  48/25;
