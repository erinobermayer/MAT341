%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2 Question to answer:
%   1. The "best" step-size for this function seems to be gamma = 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_StepSize_Gamma_To_Optimize()

gammaVec = 0.025:0.025:1.75; % Makes vector of gamma values to try

%initialize minimum N value that I know will be larger than the min
minN = 38;

%initialize minimum gamma value (randomly)
minGamma = 5;

%sweep through gamma values in gammaVec and send to GD code
for i = 1:length(gammaVec)
    NVec(i) = Gradient_Descent_1(1e-10,gammaVec(i));
    %if new N value is less than minN, change minN and minGamma
    if NVec(i) < minN
        minN = NVec(i);
        minGamma = gammaVec(i);
    end
end

minN
minGamma

%plot # of iterations vs gamma values
figure(1)
semilogx(gammaVec,NVec,'b','LineWidth',5)
legend('Fixed Step')
xlabel('Gamma')
ylabel('# of Iterations')
title('Gradient Descent: # of Iterations vs. Gamma')
