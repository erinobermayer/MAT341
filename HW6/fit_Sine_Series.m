%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5 Questions to answer:
%   1. The residual gets smaller as M increases. At M=5, the residual is 
%      0.0813, when M=10, the residual is 0.0096, when M=20, the residual
%      is 2.1412e-06, and when M=40, the residual is 3.9199e-09. (I was
%      a little confused as to whether I should be computing the l2-norm
%      SQUARED or just the l2-norm, so here are the results for the l2-
%      norm SQUARED: [M=5,norm=0.0066],[M=10,norm=9.2715e-05],
%      [M=20,norm=4.5848e-12],[M=40,norm=1.5365e-17]).
%   2. This series/process is called Fourier Sine Series. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit_Sine_Series()

%--------------------------------------------
% Total number of data points
N=500;
%--------------------------------------------
% Create the x-data points
xData=linspace(-pi,pi,N);
%----------------------------------------------------
% Create the y-data points
% apostrophe makes it a column vector and ?.?
% will perform component wise multiplication
% (rather than trying to multiply vectors together)
yData=( (0.25*xData.^2).* cos(xData).^4.* sin(xData).^7 )';

%choose the number of sine terms you want to compute (also the number of
%betas)
M = 5;

%each loop will create a column vector of A 
for i = 1:M
    A(:,i) = sin(i*xData);
end

% use the pseudo-inverse to compute the beta values
beta = inv(A'*A)*A'*yData;

% compute the l2 norm of the residuals
l2_norm = sqrt((yData-A*beta)'*(yData-A*beta))
%l2_norm_squared = (yData-A*beta)'*(yData-A*beta)

%plot the data
figure(1)
plot(xData,yData,'b','LineWidth',6); hold on;
plot(xData,A*beta,'r','LineWidth',6)
legend('Data','Best Fit Sine Series')