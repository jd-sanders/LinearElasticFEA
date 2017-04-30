% elemstiff.m
%
% 2d QUAD element stiffness routine
% This method computes the element stiffness matrix 'ke' of element 'e', if
% 'e' is a 2D QUAD element.
%
% Input paramters:
%   node                array, that stores the connectivity between nodes
%                       and dofs
%   x                   
%   y                   
%   gauss               for gauss integration
%   young               Young's modulus of element 'e'
%   pr                  Poisson's ratio of element 'e'
%   e                   Element, for which stiff matrix will be computed
%
% Returned variables:
%   ke                  Element stiffness matrix
%

function [ke] = elemstiff(node,x,y,gauss,young,pr,e);

ke = zeros(8,8);
one = ones(1,4);
psiJ = [-1, +1, +1, -1]; etaJ = [-1, -1, +1, +1];

% plane stress D matrix
fac = young(e)/(1 - (pr(e))^2);
D = fac*[1.0, pr(e), 0;
         pr(e), 1.0, 0.0;
         0, 0, (1.-pr(e))/2 ];
      
% get coordinates of element nodes 
for j=1:4
   je = node(j,e); xe(j) = x(je); ye(j) = y(je);
end

% compute element stiffness
% loop over gauss points in eta
for i=1:2
   % loop over gauss points in psi
   for j=1:2
      eta = gauss(i);  
      psi = gauss(j);
      % compute derivatives of shape functions in reference coordinates
      NJpsi = 0.25*psiJ.*(one + eta*etaJ);
      NJeta = 0.25*etaJ.*(one + psi*psiJ);
      % compute derivatives of x and y wrt psi and eta
      xpsi = NJpsi*xe'; ypsi = NJpsi*ye'; xeta = NJeta*xe';  yeta = NJeta*ye';
      Jinv = [yeta, -ypsi; -xeta, xpsi];
      jcob = xpsi*yeta - xeta*ypsi;
      % compute derivatives of shape functions in element coordinates
      NJdpsieta = [NJpsi; NJeta];
      NJdxy = Jinv*NJdpsieta;
      % assemble B matrix
      BJ = zeros(3,8);
      BJ(1,1:2:7) = NJdxy(1,1:4);  BJ(2,2:2:8) = NJdxy(2,1:4);
      BJ(3,1:2:7) = NJdxy(2,1:4);  BJ(3,2:2:8) = NJdxy(1,1:4);
      % assemble ke
      ke = ke + BJ'*D*BJ/jcob;
   end
end
