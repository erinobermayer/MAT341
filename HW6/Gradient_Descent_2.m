%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3 Questions to answer:
%   1. It takes 6 iterations to achieve 1e-6 accuracy using the Barzaili 
%      Borwein step-size.
%   2. It takes 7 iterations to achieve 1e-10 accuracy using the Barzaili 
%      Borwein step-size.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_2(tol)
    %initialize number of iterations 
    N = 0;
    %initialize error 
    err = 1;
    %initial guess
    xp = [1; 1.5];
    %initialize gamma
    gamma = 0.5;
    %run loop until err < tol
    while err > tol
        %compute next iteration
         xn = xp - gamma*gradx(xp);
         % compute new error
         err = sqrt((xn-xp)'*(xn-xp));
         %update gamma using Barzilai-Borwein step
         gamma = (abs((xn-xp)'*(gradx(xn)-gradx(xp))))/((gradx(xn)-gradx(xp))'*(gradx(xn)-gradx(xp)));
         % update xp
         xp = xn;
         %update N
         N = N + 1;
    end
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