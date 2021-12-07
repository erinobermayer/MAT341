% This function, called Successive Parabolic Interpolation, finds the approximate minimum of the
% function f(x) = 0.5 - x * e^(-x^2) between [0,2] by choosing 3 x-values
% in the interval, creating a parabola that goes through those x-values, finding the minimum of that parabola,
% and replacing one of the x-values with that minimum. We then begin the
% process again, and continue until our x-values are close enough together
% to be considered as "converged" on the minimum.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2 Questions to answer:
%   1. It takes 32 iterations to achieve 1e-8 accuracy. The approximate
%      minimum I found was at x = 0.7071.
%   2. It takes 39 iterations to achieve 1e-8 accuracy after changing.
%      x3 to be 2 instead of 0.9. To achieve 1e-14 accuracy, it takes
%      49324 iterations with the new x3 value.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = successive_Parabolic_Interpolation(tol)
    % first, pick three x-values in the interval
    x1 = 0;
    x2 = 0.6;
    x3 = 1.2;
    %establish the initial error
    err = abs(x3-x1);
    %initialize number of iterations at 0
    N = 0;
    %run while loop until the error is less than the tolerance
    while err > tol
        %find the corresponding y values
        y1 = 0.5 - x1 * exp(-(x1^2));
        y2 = 0.5 - x2 * exp(-(x2^2));
        y3 = 0.5 - x3 * exp(-(x3^2));
        %this matrix multiplication will find the a, b, and c values for
        %the parabola that goes through the three x-values
        A = inv([x1^2 x1 1; x2^2 x2 1; x3^2 x3 1])*[y1; y2; y3];
        %the minimum of the parabola is found here
        xp = -A(2)/(2*A(1));
        %we then redefine the x-values, getting rid of x1 and introducing
        %the minimum found above
        x3 = x2;
        x2 = x1;
        x1 = xp;
        %recalculate the error
        err = abs(x3-x1);
        %add one to the number of iterations
        N = N + 1;
    end
    %find the minimum (average between the x-values)
    min = (x1+x2+x3)/3;
end