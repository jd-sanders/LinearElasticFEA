% Structured meshes!

length = 16;
height = 4;

% number of elements in each direction
% bc_conv1:  2x8
% bc_conv3:  4x16
% bc_conv4:  6x24
% bc_conv5:  8x32
% bc_conv6:  10x40
% etc

ndivl = 24;
ndivw = 6;

numele = ndivw*ndivl*2;
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
        for cnt = 1:2
            elemn = (j-1)*ndivw*2 + (i-1)*2 + cnt;
            if i <= (ndivw/2)
                if cnt == 1
                    nodet(elemn,1) = (ndivw + 1)*(j-1) + i;
                    nodet(elemn,2) = nodet(elemn,1) + 1;
                    nodet(elemn,3) = nodet(elemn,2) + (ndivw + 1);
                else
                    nodet(elemn,1) = (ndivw + 1)*(j-1) + i;
                    nodet(elemn,2) = nodet(elemn,1) + (ndivw + 1) + 1;
                    nodet(elemn,3) = nodet(elemn,2) - 1 ;
                end
            else
                if cnt == 1
                    nodet(elemn,1) = (ndivw + 1)*(j-1) + i;
                    nodet(elemn,2) = nodet(elemn,1) + 1;
                    nodet(elemn,3) = nodet(elemn,1) + (ndivw + 1);
                else
                    nodet(elemn,1) = (ndivw + 1)*j + i;
                    nodet(elemn,2) = (ndivw + 1)*(j-1) + i + 1;
                    nodet(elemn,3) = (ndivw + 1)*j + i + 1;
                end  
            end
        end
    end
end

node = nodet';

clear nodet i j length height ndivl ndivw cnt elemn