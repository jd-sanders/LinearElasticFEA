% elemstiff_class.m
%
% 2d TRI element stiffness routine.
% This method computes the element stiffness matrix 'ke' of element 'e', if
% 'e' is a 2D TRI element.
%
% Input paramters:
%   node                array, that stores the connectivity between nodes
%                       and dofs
%   x                   
%   y                   
%   young               Young's modulus of element 'e'
%   pr                  Poisson's ratio of element 'e'
%   e                   Element, for which stiff matrix will be computed
%
% Returned variables:
%   ke                  Element stiffness matrix
%
function [ke] = elemstiff_class(node,x,y,young,pr,e)

ke = zeros(6);
xe = [];
ye = [];

%% plane stress D matrix
fac = young(e)/(1 - (pr(e))^2);
D = fac*[1.0, pr(e), 0;
         pr(e), 1.0, 0.0;
         0, 0, (1.-pr(e))/2 ];
     
%% plane strain D matrix
% lam = pr(e)*young(e)/((1 + pr(e))*(1-2*pr(e)));
% 
% mu = young(e)/(2*(1 + pr(e)));
% 
% D = [ lam+2*mu,  lam,      0;
%       lam,       lam+2*mu, 0;
%       0,         0,        mu]
      
%% get coordinates of element nodes 
for j=1:3
    je = node(j,e); xe(j) = x(je); ye(j) = y(je);
end

%% compute element stiffness
% compute derivatives of shape functions in reference coordinates
NJr(1) = 1;
NJr(2) = 0;
NJr(3) = -1;
NJs(1) = 0;
NJs(2) = 1;
NJs(3) = -1;
% compute derivatives of x and y wrt psi and eta
xr = NJr*xe'; yr = NJr*ye'; xs = NJs*xe';  ys = NJs*ye';
Jinv = [ys, -yr; -xs, xr];
jcob = xr*ys - xs*yr;
% compute derivatives of shape functions in element coordinates
NJdrs = [NJr; NJs];
NJdxy = Jinv*NJdrs/jcob;
% assemble B matrix
BJ = zeros(3,6);
BJ(1,1:2:5) = NJdxy(1,1:3);  BJ(2,2:2:6) = NJdxy(2,1:3);
BJ(3,1:2:5) = NJdxy(2,1:3);  BJ(3,2:2:6) = NJdxy(1,1:3);
% Area of the element
Area = det([[1 1 1]' xe' ye'])/2;
% Area = 0.5;

%% assemble ke
ke = ke + Area*BJ'*D*BJ;

