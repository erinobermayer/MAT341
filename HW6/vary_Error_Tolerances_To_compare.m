%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4 Questions to answer:
%   1. The Fixed Step algorithm appears to converge faster.
%   2. When I change the fixed step-size to 0.5, the Barzilai Borwein 
%      algorithm converges faster.
%   3. The Barzilai Borwein step-size makes the step-size better
%      each iteration, rather than keeping it the same which could
%      risk longer convergence rates. It adapts to the function being
%      minimized.
%   4. If I changed the function, I would use the Barzilai Borwein 
%      algorithm. If the function is unknown, this algorithm would
%      better adapt, because we wouldn't know the best step size to 
%      use for the Fixed Step algorithm.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_compare()

% error tolerances to iterate through
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11];

% iterate through error tolerances and run GD 1 and 2 code
for i = 1:length(errTolVec)
    NVec1(i) = Gradient_Descent_1(errTolVec(i),0.5);
    NVec2(i) = Gradient_Descent_2(errTolVec(i));
end

%plot both number of iteration vectors vs the error tolerances on a
%semi log graph
figure(1)
semilogx(errTolVec,NVec1,'b','LineWidth',5)
hold on
semilogx(errTolVec,NVec2,'r','LineWidth',5)
legend('Fixed Step','Barzilai-Borwein')
xlabel('error tolerance')
ylabel('# of Iterations')
title('N vs. tol')

%plot both number of iteration vectors vs the error tolerances on a
%log graph
figure(2)
loglog(errTolVec,NVec1,'b','LineWidth',5)
hold on
loglog(errTolVec,NVec2,'r','LineWidth',5)
legend('Fixed Step','Barzilai-Borwein')
xlabel('error tolerance')
ylabel('# of Iterations')
title('N vs. tol')