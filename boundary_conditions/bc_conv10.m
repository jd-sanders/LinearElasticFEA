% Boundary conditions for beam bending problem based on L = 16, set of
% structured mesh.  This file is for 50 elements through the thickness
%
% Right hand side - parabolic distribution of downward shear, P = -1
%

force(2*10201) =  -7304910653188982*2^(-64);
force(2*10202) =  -5404896013596899*2^(-61);
force(2*10203) =  -23/5000;
force(2*10204) =  -169/25000;
force(2*10205) =  -5086689678325409*2^(-59);
force(2*10206) =  -6221164438858546*2^(-59);
force(2*10207) =  -7300298967170555*2^(-59);
force(2*10208) =  -361/25000;
force(2*10209) =  -403/25000;
force(2*10210) =  -5102830579389905*2^(-58);
force(2*10211) =  -5531717379103652*2^(-58);
force(2*10212) =  -5932934062706835*2^(-58);
force(2*10213) =  -547/25000;
force(2*10214) =  -577/25000;
force(2*10215) =  -6970563416852997*2^(-58);
force(2*10216) =  -7261099636013922*2^(-58);
force(2*10217) =  -7523965739064283*2^(-58);
force(2*10218) =  -673/25000;
force(2*10219) =  -691/25000;
force(2*10220) =  -8146543351551981*2^(-58);
force(2*10221) =  -8298728990160085*2^(-58);
force(2*10222) =  -8423244512657624*2^(-58);
force(2*10223) =  -739/25000;
force(2*10224) =  -149/5000;
force(2*10225) =  -8630770383486856*2^(-58);
force(2*10226) =  -8644605441542139*2^(-58);
force(2*10227) =  -8630770383486856*2^(-58);
force(2*10228) =  -149/5000;
force(2*10229) =  -739/25000;
force(2*10230) =  -8423244512657624*2^(-58);
force(2*10231) =  -8298728990160085*2^(-58);
force(2*10232) =  -8146543351551981*2^(-58);
force(2*10233) =  -691/25000;
force(2*10234) =  -673/25000;
force(2*10235) =  -7523965739064283*2^(-58);
force(2*10236) =  -7261099636013922*2^(-58);
force(2*10237) =  -6970563416852997*2^(-58);
force(2*10238) =  -577/25000;
force(2*10239) =  -547/25000;
force(2*10240) =  -5932934062706835*2^(-58);
force(2*10241) =  -5531717379103652*2^(-58);
force(2*10242) =  -5102830579389905*2^(-58);
force(2*10243) =  -403/25000;
force(2*10244) =  -361/25000;
force(2*10245) =  -7300298967170555*2^(-59);
force(2*10246) =  -6221164438858546*2^(-59);
force(2*10247) =  -5086689678325409*2^(-59);
force(2*10248) =  -169/25000;
force(2*10249) =  -23/5000;
force(2*10250) =  -5404896013596899*2^(-61);
force(2*10251) =  -7304910653188982*2^(-64);


% Left hand side - displacement boundary conditions

% x fixed displacements

ifix(1,1)  = 1;    % Upper corner
ifix(1,26) = 1;    % Center
ifix(1,51) = 1;    % Lower corner

% y fixed displacements

ifix(2,26) = 1;    % Center

% Left hand side - force boundary conditions

% y-forces to balance shear on RHS

force(2*1)  =  7304910653188982*2^(-64);
force(2*2)  =  5404896013596899*2^(-61);
force(2*3)  =  23/5000;
force(2*4)  =  169/25000;
force(2*5)  =  5086689678325409*2^(-59);
force(2*6)  =  6221164438858546*2^(-59);
force(2*7)  =  7300298967170555*2^(-59);
force(2*8)  =  361/25000;
force(2*9)  =  403/25000;
force(2*10) =  5102830579389905*2^(-58);
force(2*11) =  5531717379103652*2^(-58);
force(2*12) =  5932934062706835*2^(-58);
force(2*13) =  547/25000;
force(2*14) =  577/25000;
force(2*15) =  6970563416852997*2^(-58);
force(2*16) =  7261099636013922*2^(-58);
force(2*17) =  7523965739064283*2^(-58);
force(2*18) =  673/25000;
force(2*19) =  691/25000;
force(2*20) =  8146543351551981*2^(-58);
force(2*21) =  8298728990160085*2^(-58);
force(2*22) =  8423244512657624*2^(-58);
force(2*23) =  739/25000;
force(2*24) =  149/5000;
force(2*25) =  8630770383486856*2^(-58);
force(2*27) =  8630770383486856*2^(-58);
force(2*28) =  149/5000;
force(2*29) =  739/25000;
force(2*30) =  8423244512657624*2^(-58);
force(2*31) =  8298728990160085*2^(-58);
force(2*32) =  8146543351551981*2^(-58);
force(2*33) =  691/25000;
force(2*34) =  673/25000;
force(2*35) =  7523965739064283*2^(-58);
force(2*36) =  7261099636013922*2^(-58);
force(2*37) =  6970563416852997*2^(-58);
force(2*38) =  577/25000;
force(2*39) =  547/25000;
force(2*40) =  5932934062706835*2^(-58);
force(2*41) =  5531717379103652*2^(-58);
force(2*42) =  5102830579389905*2^(-58);
force(2*43) =  403/25000;
force(2*44) =  361/25000;
force(2*45) =  7300298967170555*2^(-59);
force(2*46) =  6221164438858546*2^(-59);
force(2*47) =  5086689678325409*2^(-59);
force(2*48) =  169/25000;
force(2*49) =  23/5000;
force(2*50) =  5404896013596899*2^(-61);
force(2*51) =  7304910653188982*2^(-64);

% x-forces to assure linear distribution of stresses

force(2*2-1)  =  -288/625;
force(2*3-1)  =  -276/625;
force(2*4-1)  =  -264/625;
force(2*5-1)  =  -252/625;
force(2*6-1)  =  -240/625;
force(2*7-1)  =  -228/625;
force(2*8-1)  =  -216/625;
force(2*9-1)  =  -204/625;
force(2*10-1) =  -192/625;
force(2*11-1) =  -180/625;
force(2*12-1) =  -168/625;
force(2*13-1) =  -156/625;
force(2*14-1) =  -144/625;
force(2*15-1) =  -132/625;
force(2*16-1) =  -120/625;
force(2*17-1) =  -108/625;
force(2*18-1) =   -96/625;
force(2*19-1) =   -84/625;
force(2*20-1) =   -72/625;
force(2*21-1) =   -60/625;
force(2*22-1) =   -48/625;
force(2*23-1) =   -36/625;
force(2*24-1) =   -24/625;
force(2*25-1) =   -12/625;
force(2*27-1) =    12/625;
force(2*28-1) =    24/625;
force(2*29-1) =    36/625;
force(2*30-1) =    48/625;
force(2*31-1) =    60/625;
force(2*32-1) =    72/625;
force(2*33-1) =    84/625;
force(2*34-1) =    96/625;
force(2*35-1) =   108/625;
force(2*36-1) =   120/625;
force(2*37-1) =   132/625;
force(2*38-1) =   144/625;
force(2*39-1) =   156/625;
force(2*40-1) =   168/625;
force(2*41-1) =   180/625;
force(2*42-1) =   192/625;
force(2*43-1) =   204/625;
force(2*44-1) =   216/625;
force(2*45-1) =   228/625;
force(2*46-1) =   240/625;
force(2*47-1) =   252/625;
force(2*48-1) =   264/625;
force(2*49-1) =   276/625;
force(2*50-1) =   288/625;