function lam = Power_Iteration()

A = [0 0 0 -2; 2 0 0 0; 0 0.2 0 0; 0 0 0.2 0];

% A = A'*A;
% A = A*A';

x=rand(4,1);   % initial e-vec guess

nIter = 50;

for i = 1:nIter

    x = A*x;    % multipy previous e-vec approx by A

    x = x / sqrt( x' * x );     % normalize e-vec (could've used norm(x))

    lam = x' * A * x;   % Rayleigh Quotient (didn't need to divide by x'*x since we already normalized x)
    
    dom_eig(i) = lam;       % create and update a vector of the dominant eigenvalues
    
%     error(i) = abs(lam-3);  % create and update a vector of the error for each iteration
    
    iterNum(i) = i;         % create and update a vector of the iteration numbers
end

figure(1)
plot(iterNum, dom_eig)      % plotting the iteration number vs. the approximate eigenvalue
title('Iteration Number vs. Approximate Eigenvalue')
xlabel('Iteration Number')
ylabel('Approximate Eigenvalue')

% figure(2)
% plot(iterNum, error)        % plotting the iteration number vs. the error
