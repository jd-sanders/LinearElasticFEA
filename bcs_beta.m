% Calculate the boundary conditions for the beam bending problem.
clear

% Size of beam
P = -1;
h = 4;
L = 16;
I = 16/3;

% Number of divisions through height
ndiv_h = 24;

% Size of elements through height
he = h/ndiv_h;

% Slope of element shape function in real coordinates.

slope = 1/he;

% Number of nodes
numnod = ndiv_h/2 + 1;

% Nodal positions

for i = 1:numnod
    
    pos(i) = -2 + he*(i-1);
    
end

% intercepts

int_1 = zeros(ndiv_h/2 + 1,1);

int_2 = zeros(ndiv_h/2 + 1,1);

for i = 1:ndiv_h/2 + 1
    
    int_1(i) = (ndiv_h/2) + 2 - i;
    
end
for i = 1:ndiv_h/2
    
    int_2(i) = - (ndiv_h/2) + i;
    
end

% value of shear integral

shear  = zeros(ndiv_h/2 + 1,1);
normal = zeros(ndiv_h/2 + 1,1);

x = sym('x')

fun1 = -3/32*(4-x^2);
fun2 = P*L*x/I;

%shear(1)  = double(int(fun1*(slope*x + int_2(1)),-2,-2 + he));
%normal(1) = double(int(fun2*(slope*x + int_2(1)),-2,-2 + he));

for i = (2:(ndiv_h/2))
    shp1 =  slope*x + int_1(i);
    shp2 = -slope*x + int_2(i);
    
    shear(i) = double(int(fun1*shp1,pos(i-1),pos(i))...
                + int(fun1*shp2,pos(i),pos(i+1)));

    normal(i) = double(int(fun2*shp1,pos(i-1),pos(i))...
                + int(fun2*shp2,pos(i),pos(i+1)));   
end