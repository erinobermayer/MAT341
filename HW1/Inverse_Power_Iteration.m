function Inverse_Power_Iteration()

C = [3/2 1/2 -1/2; -1/2 5/2 1/2; -1 1 2];

mu = 1.49;       %make guess of eigenvalue
x(:,1) = rand(3,1);     %initial eigenvector guess

%create vector to keep track of iteration numbers
iterNum(1) = 1;

% iterate to find approximations
for j = 2:100
    
    %new eigenvector approximation
    x(:,j) = inv(C - mu*eye(3,3))*x(:,j-1);
    
    %normalize eigenvector approximation
    x(:,j) = x(:,j)/sqrt(x(:,j)'*x(:,j));
    
    %compute new eigenvalue approximation
    lam(j) = x(:,j)'*C*x(:,j);
    
    %update iteration numbers
    iterNum(j) = j;
    
end

figure(1)
plot(iterNum, lam)      % plotting the iteration number vs. the approximate eigenvalue
xlabel('Iteration Number')
ylabel('Approximate Eigenvalue')
title('Iteration Number vs. Approximate Eigenvalue')
