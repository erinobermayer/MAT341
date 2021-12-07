function N = v2_Golden_Search(tau)  %input search step, tau
%set error tolerance
tol = 1e-14;
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