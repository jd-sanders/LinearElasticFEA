% Boundary conditions for beam bending problem based on L = 16, set of
% structured mesh.  This file is for 24 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*2809) =   -51/35152;
force(2*2810) =  -149/17576;
force(2*2811) =  -287/17576;
force(2*2812) =  -413/17576;
force(2*2813) =  -527/17576;
force(2*2814) =  -629/17576;
force(2*2815) =  -719/17576;
force(2*2816) =  -797/17576;
force(2*2817) =  -863/17576;
force(2*2818) =  -917/17576;
force(2*2819) =  -959/17576;
force(2*2820) =  -989/17576;
force(2*2821) = -1007/17576;
force(2*2822) = -1013/17576;
force(2*2823) = -1007/17576;
force(2*2824) =  -989/17576;
force(2*2825) =  -959/17576;
force(2*2826) =  -917/17576;
force(2*2827) =  -863/17576;
force(2*2828) =  -797/17576;
force(2*2829) =  -719/17576;
force(2*2830) =  -629/17576;
force(2*2831) =  -527/17576;
force(2*2832) =  -413/17576;
force(2*2833) =  -287/17576;
force(2*2834) =  -149/17576;
force(2*2835) =   -51/35152;

% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1)  = 1;    % Upper corner
ifix(1,14) = 1;    % Center
ifix(1,27) = 1;    % Lower corner

% y fixed displacements

ifix(2,14) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1)  =   51/35152;
force(2*2)  =  149/17576;
force(2*3)  =  287/17576;
force(2*4)  =  413/17576;
force(2*5)  =  527/17576;
force(2*6)  =  629/17576;
force(2*7)  =  719/17576;
force(2*8)  =  797/17576;
force(2*9)  =  863/17576;
force(2*10) =  917/17576;
force(2*11) =  959/17576;
force(2*12) =  989/17576;
force(2*13) = 1007/17576;
force(2*15) = 1007/17576;
force(2*16) =  989/17576;
force(2*17) =  959/17576;
force(2*18) =  917/17576;
force(2*19) =  863/17576;
force(2*20) =  797/17576;
force(2*21) =  719/17576;
force(2*22) =  629/17576;
force(2*23) =  527/17576;
force(2*24) =  413/17576;
force(2*25) =  287/17576;
force(2*26) =  149/17576;
force(2*27) =   51/35152;

% x-forces to assure linear distribution of stresses

force(2*2-1)  = -144/169;
force(2*3-1)  = -132/169;
force(2*4-1)  = -120/169;
force(2*5-1)  = -108/169;
force(2*6-1)  =  -96/169;
force(2*7-1)  =  -84/169;
force(2*8-1)  =  -72/169;
force(2*9-1)  =  -60/169;
force(2*10-1) =  -48/169;
force(2*11-1) =  -36/169;
force(2*12-1) =  -24/169;
force(2*13-1) =  -12/169;
force(2*15-1) =   12/169;
force(2*16-1) =   24/169;
force(2*17-1) =   36/169;
force(2*18-1) =   48/169;
force(2*19-1) =   60/169;
force(2*20-1) =   72/169;
force(2*21-1) =   84/169;
force(2*22-1) =   96/169;
force(2*23-1) =  108/169;
force(2*24-1) =  120/169;
force(2*25-1) =  132/169;
force(2*26-1) =  144/169;