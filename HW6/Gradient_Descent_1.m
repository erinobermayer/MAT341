% This function will find the a minimum of f(x, y) = -( sin(x) + cos(y)) using Gradient
% Descent. It will take two inputs, the tolerance and gamma value. It will
% output the number of iterations it takes to converge, N.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1 Questions to answer:
%   1. It takes 35 iterations to achieve 1e-10 accuracy with gamma 0.5.
%   2. It takes 12 iterations to achieve 1e-10 accuracy with gamma 0.9.
%   3. It takes 34 iterations to achieve 1e-10 accuracy with gamma 1.5.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_1(tol,gamma)
    %initialize number of iterations 
    N = 0;
    %initialize error 
    err = 1;
    %initial guess
    xp = [1; 1.5];
    %run loop until err < tol
    while err > tol
        %compute next iteration
         xn = xp - gamma*[-cos(xp(1)); sin(xp(2))];
         % compute new error
         err = sqrt((xn-xp)'*(xn-xp));
         % update xp
         xp = xn;
         %update N
         N = N + 1;
    end
end