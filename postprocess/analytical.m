function [anal] = analytical(x,y);

E = 1000.0;
pr = 0.0; 
P = -1;
h = 4;
I = h^3/12;
L = 16;
c = h/2;

%G = E/(2*(1+pr));

x_bar = L-x;


% Soln 2
% 
% anal(1) = (P*x2*(L-x1)^2)/(2*E*I)   + (pr*P*x2^3)/(6*E*I) -...
%    (P*x2^3)/(6*G*I) - (P*L^2*x2)/(2*E*I);
% 
% anal(2) = (pr*P*(L-x1)*x2^2)/(2*E*I) + (P*(L-x1)^3)/(6*E*I)-...
%    (P*L^3)/(6*E*I) + (P*L^2*x1)/(2*E*I) + (P*h^2*x1)/(8*G*I);

anal(1) = P/(6*E*I)*(-y*(3*(L^2 - x_bar^2) + (2 + pr)*(y^2 - c^2)));

anal(2) = P/(6*E*I)*((x_bar^3 - L^3) - ((4 + 5*pr)*c^2 + 3*L^2)*(x_bar - L)...
            + 3*pr*x_bar*y^2);

