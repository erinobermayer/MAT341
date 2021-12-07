function N = Newtons_1D_Opt(tol)
    %initialize number of iterations 
    N = 0;
    %initialize guess
    xp = 0.25;
    %initialize error
    err = 1;
    %run loop until error < tolerance
    while err > tol
        %calculate root of derivative using newtons method
        xn = xp - ( -exp(-(xp^2)) + 2*(xp^2)*exp(-(xp^2)) ) / ( 2*xp*exp(-(xp^2)) + 4*xp*exp(-(xp^2)) - 4*(xp^3)*exp(-(xp^2)) );
        %calculate new error
        err = abs(xn-xp);
        %update xp
        xp = xn;
        %update N
        N = N + 1;
    end
end