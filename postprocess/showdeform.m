% showdeform.m
%
% Plots the deformation of the domain.
%

for i = 1:numnod
    x_def(i) = x(i) + disp(2*i-1);
    y_def(i) = y(i) + disp(2*i); 
end

h = plot(x_def(1:numnod),y_def(1:numnod));
set(h,'LineStyle','none');
set(h,'Marker','o');
set(h,'MarkerEdgeColor','Red');
set(h,'MarkerFaceColor','Red');
set(h,'MarkerSize',4)
axis([-1 21 -7 7]);

% hold on
% 
% g = plot(x_def(numnod_1+1:numnod),y_def(numnod_1+1:numnod));
% set(g,'LineStyle','none');
% set(g,'Marker','o');
% set(g,'MarkerEdgeColor','Green');
% set(g,'MarkerFaceColor','Green');
% set(g,'MarkerSize',3)
% axis([-10 60 -30 30]);
