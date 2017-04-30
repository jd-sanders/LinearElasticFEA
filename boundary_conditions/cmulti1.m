% cmulti1.m
%
% Describes boundary conditions for multi-grain example.
%

% Left end boundary conditions

for i=1:numnod
   if abs(x(i) - 0) < 0.0001
       ifix(2,i)   = 1.0;
       ifix(1,i)   = 1.0;
   end
end

% Right end boundary conditions
% This we need to do separatly for each node

%load = 200;

force(2*21-1)  = endload*0.225;
force(2*130-1) = endload*0.450;
force(2*66-1)  = endload*0.500;
force(2*132-1) = endload*0.550;
force(2*22-1)  = endload*0.500;
force(2*127-1) = endload*0.450;
force(2*67-1)  = endload*0.500;
force(2*125-1) = endload*0.550;
force(2*23-1)  = endload*0.275;
