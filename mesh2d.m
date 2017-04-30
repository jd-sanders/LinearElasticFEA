% mesh2d.m
%
% MESH GENERATION PROGRAM FOR 2D BEAM IN BENDING
%
% Input parameters:
%   length              length of rectangular domain, that has to be meshed
%   height              height of rectangular domain, that has to be meshed
%
% Returned variables:
%   x                   
%   y                   
%   node                array, that stores the connectivity between nodes
%                       and dofs
%   numele              number of elements in diskretization
%   numnod              number of nodes in deskretization
%

function[x,y,node,numele,numnod] = mesh2d(length,height)

% number of elements in each direction
ndivl = 40;
ndivw = 6;

numele = ndivw*ndivl;
numnod = (ndivl+1)*(ndivw+1);


% set up nodal coordinates

for i = 1:(ndivl+1)
   for j=1:(ndivw+1)
      x((ndivw+1)*(i-1)+j) = (length/ndivl)*(i-1);
      y((ndivw+1)*(i-1)+j) = height/2 -(height/ndivw)*(j-1);
   end
end

% set up connectivity array

for j=1:ndivl
   for i=1:ndivw
      elemn = (j-1)*ndivw + i;
      nodet(elemn,1) = elemn + (j-1);
      nodet(elemn,2) = nodet(elemn,1) + 1;
      nodet(elemn,3) = nodet(elemn,2) + ndivw + 1;
      nodet(elemn,4) = nodet(elemn,3) -1;
   end
end

node = nodet';