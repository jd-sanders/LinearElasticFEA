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


% intercept of shape function "1"

int_1 = zeros(ndiv_h/2 + 1,1);

% intercept of shape function "2"

int_2 = zeros(ndiv_h/2,1);

for i = 1:ndiv_h/2 + 1
    
    int_1(i) = - (ndiv_h/2) + i;
    
end
for i = 1:ndiv_h/2
    
    int_2(i) = 1 + (ndiv_h/2) - i;
    
end

% value of shear integral

shear  = zeros(ndiv_h/2 + 1,1);
normal = zeros(ndiv_h/2 + 1,1);

x = sym('x')

fun1 = -3/32*(4-x^2);
fun2 = P*L*x/I;

shear(1)  = double(int(fun1*(slope*x + int_1(1)),2-he,2));
normal(1) = double(int(fun2*(slope*x + int_1(1)),2-he,2));

for i = (2:(ndiv_h/2+1))
    shp1 =  slope*x + int_1(i);
    shp2 = -slope*x + int_2(i-1);
    
    shear(i) = double(int(fun1*shp1,2-he*(i),2-he*(i-1))...
                + int(fun1*shp2,2-he*(i-1),2-he*(i-2)));

    normal(i) = double(int(fun2*shp1,2-he*(i),2-he*(i-1))...
                + int(fun2*shp2,2-he*(i-1),2-he*(i-2)));   
end