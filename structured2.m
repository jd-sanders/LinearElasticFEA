% Structured meshes!

length = 16;
height = 2;

% number of elements in each direction
ndivl = 24;      % Number of blocks through length   
ndivw = 3;

numele = ndivw*ndivl*4;
numnod1 = (ndivl+1)*(ndivw+1);  % numer of nodes in first swipe
numnod = (ndivl+1)*(ndivw+1) + (ndivl*ndivw);   % total number of nodes


% set up nodal coordinates


for i = 1:(ndivl+1)
   for j=1:(ndivw+1)
            x((ndivw+1)*(i-1)+j) = (length/ndivl)*(i-1);
            y((ndivw+1)*(i-1)+j) = height -(height/ndivw)*(j-1);           
   end
end

for i = 1:ndivl
    for j = 1:ndivw
        x(numnod1 + ndivw*(i-1) + j) = length/(2*ndivl) + length/ndivl*(i-1);
        y(numnod1 + ndivw*(i-1) + j) = height - (height/(2*ndivw)) - (height/ndivw)*(j-1);
    end
end

% set up connectivity array

for j=1:ndivl
    for i=1:ndivw
        for cnt = 1:4
           
        elemn = (j-1)*ndivw*4 + (i-1)*4 + cnt;
        
            if cnt == 1
                nodet(elemn,1) = (ndivw + 1)*(j-1) + i;
                nodet(elemn,2) = (ndivw + 1)*(j-1) + i + 1;
                nodet(elemn,3) = numnod1 + ndivw*(j-1) + i;
            elseif cnt ==2
                nodet(elemn,1) = (ndivw + 1)*(j-1) + i;
                nodet(elemn,2) = numnod1 + ndivw*(j-1) + i;
                nodet(elemn,3) = (ndivw + 1)*j + i;           
            elseif cnt == 3
                nodet(elemn,1) = (ndivw + 1)*j + i;
                nodet(elemn,2) = numnod1 + ndivw*(j-1) + i;
                nodet(elemn,3) = (ndivw + 1)*j + i + 1;
            elseif cnt == 4
                nodet(elemn,1) = numnod1 + ndivw*(j-1) + i;
                nodet(elemn,2) = (ndivw + 1)*(j-1) + i + 1;
                nodet(elemn,3) = (ndivw + 1)*j + i + 1;
            end  
        end
    end
end

node = nodet';

clear nodet i j length height ndivl ndivw cnt elemn