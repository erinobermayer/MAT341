function output = NelderMead(tol)
    % choose 3 points to start
    x1 = [0.35 2.8];
    x2 = [4 4];
    x3 = [4.5 4.5];
    %set error and tolerance
    err = 1;
    %establish number of iterations
    N = 0;
    %tol = 1e-8;
    %we will run this loop until the error is less than the tolerance
    while err > tol
        % update number of iterations
        N = N+1;
        % we will establish x and y vectors, so once we sort x1, x2, and x3
        % based on their function values, we can reference the correct
        % order
        xVec = [x1(1) x2(1) x3(1)];
        yVec = [x1(2) x2(2) x3(2)];
        % evaluate my function at x1, x2, and x3
        fx1 = -sin(x1(1))-cos(x1(2));
        fx2 = -sin(x2(1))-cos(x2(2));
        fx3 = -sin(x3(1))-cos(x3(2));
        % now, create a function vector similar to the x and y vectors that
        % we can sort
        fVec = [fx1 fx2 fx3];
        % sort the function vector to be in least to greatest. Also, store
        % the indices in indVec
        [a,indVec] = sort(fVec);
        % redefine x1, x2, and x3 based on how fVec was sorted (now,
        % f(x1)<f(x2)<f(x3), and x1 is the "best" value
        x1 = [xVec(indVec(1)) yVec(indVec(1))];
        x2 = [xVec(indVec(2)) yVec(indVec(2))];
        x3 = [xVec(indVec(3)) yVec(indVec(3))];
        % redefine fVec to be the sorted version (THIS MIGHT BE UNECESSARY)
        fVec = a;
        % compute the midpoint between the two better values, x1 and x2
        xm = 0.5*(x1+x2);
        % compute a reach vector and its function value
        xr = xm + (xm-x3);
        fxr = -sin(xr(1))-cos(xr(2));
        %if this new function value is a better guess than x3, replace it
        if fxr < fVec(3)
            x3 = xr;
        %otherwise, choose a different point
        elseif fxr >= fVec(3)
            %define xc to be halfway between 
            xc = 0.5*(x3+xm);
            fxc = -sin(xc(1))-cos(xc(2));
            %make sure this new point is better than x3
            if fxc < fx3
                x3 = xc;
            %otherwise, make the triangle smaller
            else
                x2 = xm;
                x3 = 0.5*(x1+x3);
            end
        end
        fx3 = -sin(x3(1))-cos(x3(2));
        %compute the error
        err = abs(fx1 - fx3);
    end
    %compute the approximate min value
    approx_min = (x1+x2+x3)./3
    output = N;
end