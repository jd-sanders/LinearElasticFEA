% Boundary conditions for beam bending problem based on L = 16, set of
% structured mesh.  This file is for 18 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*1369) =  -35/11664;
force(2*1370) = -101/5832;
force(2*1371) = -191/5832;
force(2*1372) = -269/5832;
force(2*1373) = -335/5832;
force(2*1374) = -389/5832;
force(2*1375) = -431/5832;
force(2*1376) = -461/5832;
force(2*1377) = -479/5832;
force(2*1378) = -485/5832;
force(2*1379) = -479/5832;
force(2*1380) = -461/5832;
force(2*1381) = -431/5832;
force(2*1382) = -389/5832;
force(2*1383) = -335/5832;
force(2*1384) = -269/5832;
force(2*1385) = -191/5832;
force(2*1386) = -101/5832;
force(2*1387) =  -35/11664;



% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1)  = 1;    % Upper corner
ifix(1,10) = 1;    % Center
ifix(1,19) = 1;    % Lower corner

% y fixed displacements


ifix(2,10) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

%force(2*1)  =  35/11664;
force(2*2)  = 101/5832;
force(2*3)  = 191/5832;
force(2*4)  = 269/5832;
force(2*5)  = 335/5832;
force(2*6)  = 389/5832;
force(2*7)  = 431/5832;
force(2*8)  = 461/5832;
force(2*9)  = 479/5832;
force(2*11) = 479/5832;
force(2*12) = 461/5832;
force(2*13) = 431/5832;
force(2*14) = 389/5832;
force(2*15) = 335/5832;
force(2*16) = 269/5832;
force(2*17) = 191/5832;
force(2*18) = 101/5832;
%force(2*19) =  35/11664;

% x-forces to assure linear distribution of stresses

force(2*2-1)  = -32/27;
force(2*3-1)  = -28/27;
force(2*4-1)  = -24/27;
force(2*5-1)  = -20/27;
force(2*6-1)  = -16/27;
force(2*7-1)  = -12/27;
force(2*8-1)  =  -8/27;
force(2*9-1)  =  -4/27;
force(2*11-1) =   4/27;
force(2*12-1) =   8/27;
force(2*13-1) =  12/27;
force(2*14-1) =  16/27;
force(2*15-1) =  20/27;
force(2*16-1) =  24/27;
force(2*17-1) =  28/27;
force(2*18-1) =  32/27;