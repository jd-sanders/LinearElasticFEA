% error_norm.m
%
% Calucates the L2 norm of the error in a problem with tri elements.  
%

% Jessica Sanders

%Initialize error
total_errorx = 0;
total_errory = 0;

total_apprx = 0;
total_appry = 0;

for j = 1:numele

    % initialize element error
    element_errorx = 0;
    element_errory = 0;
    
    approx_solnx = 0;
    approx_solny = 0;

    % get nodes:
    nodes = node(:,j);

    % get coordinates:
    xe = x(nodes);
    ye = y(nodes);

    % get nodal displacements
    xd = disp(2*nodes-1);
    yd = disp(2*nodes);

    % define Gauss points and weights
    gr = [0.2 0.6 0.2 1/3];
    gs = [0.2 0.2 0.6 1/3];
    wg = [25/48 25/48 25/48 -9/16]; 

%     % Define 6-point Gauss quadrature
%     gr = [0.816847572980459 0.091576213509771 0.091576213509771 0.108103018168070 0.445948490915965 0.445948490915965];
%     gs = [0.091576213509771 0.091576213509771 0.816847572980459 0.445948490915965 0.445948490915965 0.108103018168070];
%     wg = [0.109951743655322 0.109951743655322 0.109951743655322 0.223381589678011 0.223381589678011 0.223381589678011];

    % Define 12-point Gauss quadrature
    
    gr =    [0.873821971016996 0.063089014491502 0.063089014491502];
    gs =    [0.063089014491502 0.063089014491502 0.873821971016996];
    wg =    [0.050844906370207 0.050844906370207 0.050844906370207];
    
    gr = [gr 0.501426509658179 0.249286745170910 0.249286745170910];
    gs = [gs 0.249286745170910 0.249286745170910 0.501426509658179];
    wg = [wg 0.116786275726379 0.116786275726379 0.116786275726379];
    
    gr = [gr 0.636502499121399 0.310352451033785 0.053145049844816 0.636502499121399 0.310352451033785 0.053145049844816];
    gs = [gs 0.310352451033785 0.053145049844816 0.636502499121399 0.053145049844816 0.636502499121399 0.310352451033785];
    wg = [wg 0.082851075618374 0.082851075618374 0.082851075618374 0.082851075618374 0.082851075618374 0.082851075618374];
    

    % loop over Gauss points
    for i = 1:12
    
        r = gr(i);
        s = gs(i);
    
        % Shape functions
        N1 = r;
        N2 = s;
        N3 = 1-r-s; 
        
        % Shape function derivatives
        Ndr(1) = 1;
        Nds(1) = 0;
        Ndr(2) = 0;
        Nds(2) = 1;
        Ndr(3) = -1;
        Nds(3) = -1;
    
        % compute derivatives of x and y wrt psi and eta
        xdr = Ndr*xe'; ydr = Ndr*ye'; xds = Nds*xe';  yds = Nds*ye';
        jcob = xdr*yds - xds*ydr;
    
        Area = det([[1 1 1]' xe' ye'])/2;

        % The displacements as a function of r and s
        dx_feta = N1*xd(1) + N2*xd(2) + N3*xd(3);
        dy_feta = N1*yd(1) + N2*yd(2) + N3*yd(3);
    
        % x and y as a function of eta (for the analytical solution)
        x_feta = N1*xe(1) + N2*xe(2) + N3*xe(3);
        y_feta = N1*ye(1) + N2*ye(2) + N3*ye(3);
    
        % Get analytical solution
        anal = analytical(x_feta, y_feta);
    
        % Difference between analytical and numerical solutions - error!
        ex = dx_feta - anal(1);
        ey = dy_feta - anal(2);
    
        % square the error
        ex2 = ex^2;
        ey2 = ey^2;
    
        % Assemble the squared error over the element
        element_errorx = element_errorx + ex2*wg(i)*jcob;
        element_errory = element_errory + ey2*wg(i)*jcob;
        
        % Assemble the approximate soln norm over the element
        approx_solnx = approx_solnx + (dx_feta)^2*wg(i)*jcob;
        approx_solny = approx_solny + (dy_feta)^2*wg(i)*jcob;
        
        
    end
    total_errorx = total_errorx + 0.5*element_errorx;
    total_errory = total_errory + 0.5*element_errory;
    
    total_apprx = total_apprx + 0.5*approx_solnx;
    total_appry = total_appry + 0.5*approx_solny;
    
end

L2norm = sqrt(total_errorx + total_errory)/sqrt(total_apprx + total_appry);
