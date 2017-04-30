% plotmesh.m
%
% Plots the meshed domain.
%

figure(1)
hold on
for e=1:numele
   %plot(x(node(1:4,e))/4,y(node(1:4,e))/4+0.5)
   %plot([x(node(4,e))/4 x(node(1,e))/4],[y(node(4,e))/4+0.5 y(node(1,e))/4+0.5])
   plot(x(node(1:3,e)),y(node(1:3,e)))
   plot([x(node(3,e)) x(node(1,e))],[y(node(3,e)) y(node(1,e))])
end