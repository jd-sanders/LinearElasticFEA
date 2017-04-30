% applybcs.m
% 
% This method applies boundary conditions.
%
% input parameters: 
%   exampleID       shows, which example is in evaluation
%   x               
%   y                 
%   numnod           
%   endload           
%
% returned variables:
%   force            
%   ifix              
%

function [force,ifix] = applybcs(exampleID,x,y,numnod,endload)

force = zeros(1,numnod*2);
ifix = zeros(2,numnod);

% Call boundary conditions from a difference file
switch exampleID
    case 1              % BCs for beam2d example
        boundary_conditions/bc_conv4        % call m-file with BCs
    case 2              % BCs for multi-grain example
        boundary_conditions/cmulti1         % call m-file with BCs
    otherwise
        error('ERROR: Update switch-structure !!!')   % error-msg and abort
end;
%cmulti1
