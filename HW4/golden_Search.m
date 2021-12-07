% This function, called "Golden" Section Search, finds the approximate minimum of the
% function f(x) = 0.5 - x * e^(-x^2) between [0,2] by choosing 2 x-values
% in the interval, and whichever x-value has a greater y-value will replace
% one of the endpoints, making the section smaller. We then begin the
% process again, and continue until our section converges on the minimum
% x-value.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1 Questions to answer:
%   1. It takes 40 iterations to achieve 1e-8 accuracy.
%   2. It takes 69 iterations to achieve 1e-14 accuracy.
%   3. When you try to achieve an accuracy of 1e-20, the code
%      never stops running. I think this is because computers
%      can only get so close to a number, and certain accuracies
%      just take too long or too much power for a computer to handle.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = golden_Search(tol)   %input the tolerance level
%set tau, the search step
tau = (sqrt(5)-1)/2;
%establish our interval [a,b] and error as the distance between the
%intervals
a = 0;
b = 2;
err = abs(b-a);
%begin with 0 iterations
N = 0;
%begin a while loop that ends once the error is less than the tolerance
while err > tol
    %choose two new x values in the interval that are tau distance from the
    %endpoints
    x1 = a + tau*(b-a);
    x2 = b - tau*(b-a);
    %make sure x1 < x2
    if x1 > x2
        place = x1;
        x1 = x2;
        x2 = place;
    end
    %find the corresponding y values
    fx1 = 0.5-(x1)*exp(-(x1)^2);
    fx2 = 0.5-(x2)*exp(-(x2)^2);
    %see which y values is larger, pick that one to replace the endpoint
    %that it's closer to
    if fx1 > fx2
        a = x1;
    else
        b = x2;
    end
    %compute the error and min
    err = abs(b-a);
    min = (a+b)/2;
    %add to iterations
    N = N+1;
end
end