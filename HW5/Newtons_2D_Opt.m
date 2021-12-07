% Run Multi-Variable Newton's Method
function N = Newtons_2D_Opt(tol)
    %initialize iteration number
    N = 0;
    %initial guess
    xp = [-4.5;4.5];
    %initialize error
    err = 1;
    %run loop until error < tolerance
    while err > tol
        %calculate root of gradient using Newton's Method
        xn = xp - invH(xp)*gradx(xp);
        %calculate new error (L2)
        err = sqrt((xn - xp)'*(xn - xp));
        %update xp
        xp = xn;
        %update iteration number
        N = N + 1;
    end
    xp
end

% Calculate the inverse Hessian matrix for xp
function output = invH(xp)
    %redefine xp vector as x and y
    x = xp(1);
    y = xp(2);
    %calculate second partial derivatives
    fxx = sin(x);
    fxy = 0;
    fyy = cos(y);
    %create Hessian matrix
    H = [fxx fxy; fxy fyy];
    %output inverse of Hessian
    output = inv(H);
end

% Calculate the gradient vector of xp
function output = gradx(xp)
    %redefine xp vector as x and y
    x = xp(1);
    y = xp(2);
    %calculate first partial derivatives
    fx = -cos(x);
    fy = sin(y);
    %output  gradient vector
    output = [fx;fy];
end