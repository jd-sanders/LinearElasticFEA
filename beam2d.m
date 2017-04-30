% 2D FE PROGRAM FOR TRIANGLES
%

%clear
%INPUT DATA - get mesh

%% DEFINE THE EXAMPLE

% Set ID of example, which you want to solve
% ID    Description
% 1     beam
% 2     multi-grain

exampleID = 1;          % Set exampleID here !

switch exampleID
    case 1
        unvalidexampleID = 0;   % indicates, that ID=1 is valid
    case 2
        unvalidexampleID = 0;   % indicates, that ID=2 is valid
    otherwise
        unvalidexampleID = 1;   % indicates, that ID is unvalid
        error('ERROR: Invalid exampleID !!!')   % error-msg and abort
end;

% Define the set of BCs in file 'applybsc.m'

%% MESHING AND SOME PARAMETERS
sprintf('meshing')
% Mesh structured grid

switch exampleID
    case 1              % beam2D example
        structured
    case 2              % multi-grain example
        mat_files/load cmulti1
        mat_files/load random23
        endload = 1;
    otherwise
        error('ERROR: Update switch-structure !!!')   % error-msg and abort
end

% Check and correct nodal connectivity
for e = 1:numele
    for j=1:3
        je = node(j,e); xe(j) = x(je); ye(j) = y(je);
    end

    Area = det([[1 1 1]' xe' ye'])/2;
    if Area < 0
        temp = node(1,e);
        node(1,e) = node(3,e);
        node(3,e) = temp;
    end
end

%% MATERIAL CONSTANTS

pr = 0.0.*ones(1,numele);
young = 1000.*ones(1,numele);


if exampleID == 2       % Assign E-moduli to element, depending in which
                        % grain it is (for multi-grain example only)
    for i = 1:numele
       young(i) = 3e7.*random(tag_element(i));
    end;
end;

%% FORCE AND DISPLACEMENT BC'S
switch exampleID
    case 1
        [force,ifix] = applybcs(exampleID,x,y,numnod);    % for beam2d example
    case 2
        [force,ifix] = applybcs(exampleID,x,y,numnod,endload);    % for multi-grain example
    otherwise
        error('ERROR: Update switch-structure !!!')   % error-msg and abort
end;

%% ASSEMBLY
sprintf('assembling stiffness')

%ASSEMBLY OF STIFFNESS
ndof = 2; %degrees of freedom per node
numeqns = numnod*ndof;
bigk = spalloc(numeqns,numeqns,numele*36);
%bigk = zeros(numeqns);

%
% loop over elements
%
% nlink is # of nodes per element
nlink = 3;
for e = 1:numele
   [ke] = elemstiff_class(node,x,y,young,pr,e);
   %
   % assemble ke into bigk
   %
   n1 = ndof-1;
   for i=1:nlink;
      for j=1:nlink;
         rbk = ndof*(node(i,e)-1) + 1;
         cbk = ndof*(node(j,e)-1) + 1;
         re = ndof*(i-1)+1;
         ce = ndof*(j-1)+1;
         bigk(rbk:rbk+n1, cbk:cbk+n1) = bigk(rbk:rbk+n1, cbk:cbk+n1) + ke(re:re+n1, ce:ce+n1);
      end;
   end;
end;

% enforce boundary conditions 
% essential bcs assumed homogeneous
for n=1:numnod
   for j=1:ndof
      if (ifix(j,n) == 1)
         m = ndof*(n-1)+j;
         bigk(m,:) = zeros(1,numeqns);
         bigk(:,m) = zeros(numeqns,1);
         bigk(m,m) = 1.0;
         force(m) = 0;
      end
   end
end

%% SOLVE
sprintf('solving')

%solve stiffness equations
disp = force/bigk;              % disp ... displacement-vector

%% POST PROCESSING
%%compute stresses at center of each element

stress = zeros(numele,6);
for e=1:numele
   [stresse] = post_process(node,x,y,young,pr,e,disp);
   stress(e,1:6) = stresse;
end


sprintf('saving results file')

%% GIVE SOME FINAL INFORMATION TO THE USER
if unvalidexampleID == 0
    sprintf('That was example No. %d', exampleID)
end;
clear exampleID unvalidexampleID;
    







