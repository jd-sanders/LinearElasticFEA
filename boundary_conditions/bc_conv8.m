% Boundary conditions for beam bending problem based on L = 16, set of
% structured mesh.  This file is for 22 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*2025) =  -43/21296;
force(2*2026) = -125/10648;
force(2*2027) = -239/10648;
force(2*2028) = -341/10648;
force(2*2029) = -431/10648;
force(2*2030) = -509/10648;
force(2*2031) = -575/10648;
force(2*2032) = -629/10648;
force(2*2033) = -671/10648;
force(2*2034) = -701/10648;
force(2*2035) = -719/10648;
force(2*2036) = -725/10648;
force(2*2037) = -719/10648;
force(2*2038) = -701/10648;
force(2*2039) = -671/10648;
force(2*2040) = -629/10648;
force(2*2041) = -575/10648;
force(2*2042) = -509/10648;
force(2*2043) = -431/10648;
force(2*2044) = -341/10648;
force(2*2045) = -239/10648;
force(2*2046) = -125/10648;
force(2*2047) =  -43/21296;

% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1)  = 1;    % Upper corner
ifix(1,12) = 1;    % Center
ifix(1,23) = 1;    % Lower corner

% y fixed displacements

ifix(2,12) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1)  =  43/21296;
force(2*2)  = 125/10648;
force(2*3)  = 239/10648;
force(2*4)  = 341/10648;
force(2*5)  = 431/10648;
force(2*6)  = 509/10648;
force(2*7)  = 575/10648;
force(2*8)  = 629/10648;
force(2*9)  = 671/10648;
force(2*10) = 701/10648;
force(2*11) = 719/10648;
force(2*13) = 719/10648;
force(2*14) = 701/10648;
force(2*15) = 671/10648;
force(2*16) = 629/10648;
force(2*17) = 575/10648;
force(2*18) = 509/10648;
force(2*19) = 431/10648;
force(2*20) = 341/10648;
force(2*21) = 239/10648;
force(2*22) = 125/10648;
force(2*23) =  43/21296;

% x-forces to assure linear distribution of stresses

force(2*2-1)  = -120/121;
force(2*3-1)  = -108/121;
force(2*4-1)  =  -96/121;
force(2*5-1)  =  -84/121;
force(2*6-1)  =  -72/121;
force(2*7-1)  =  -60/121;
force(2*8-1)  =  -48/121;
force(2*9-1)  =  -36/121;
force(2*10-1) =  -24/121;
force(2*11-1) =  -12/121;
force(2*13-1) =   12/121;
force(2*14-1) =   24/121;
force(2*15-1) =   36/121;
force(2*16-1) =   48/121;
force(2*17-1) =   60/121;
force(2*18-1) =   72/121;
force(2*19-1) =   84/121;
force(2*20-1) =   96/121;
force(2*21-1) =  108/121;
force(2*22-1) =  120/121;