%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Performs Non-linear Least Squares for HW6, Prob 6.
%
%   AUTHOR: 
%     DATE:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function perform_NonLinear_Least_Squares()

%------------------------------------------------------------
%
% LOADS a .mat file which hands you a matrix, DATA
%   
%       NOTE: (1) DATA(:,1) <- x values (1st column)
%             (2) DATA(:,2) <- y values (2nd column)
%
%------------------------------------------------------------
load('HW6_Prob6_Data.mat');

% *** CAN USE MATRIX DATA BELOW AS THOUGH YOU CREATED IT 
%       PREVIOUSLY  ONCE YOU LOAD IT IN THE PREVIOUS LINE ****

xVec = DATA(:,1); % grabs x-Values from DATA
yVec = DATA(:,2); % grabs y-Values from DATA

% initial guess
BetaP = [1 0.5 0.3]';

% initialize error, tolerance, and # iterations
err = 1;
tol = 1e-5;
N = 0;

% begin while loop, run until err < tol
while err > tol
    % use function 2 to compute Jacobian-like matrix J
    J = compute_Jacobian(BetaP,xVec);
    % use function 3 to compute dely
    dely = compute_dely(BetaP,xVec,yVec);
    % use pseudo-inverse to compute delBetak vector
    delBetaK = (J'*J)\J'*dely;
    % new approximation
    BetaN = BetaP + delBetaK;
    % compute error (l^2 norm)
    err = sqrt((BetaN-BetaP)'*(BetaN-BetaP));
    % redefine BetaP for next iter
    BetaP = BetaN;
    % update # of iters
    N = N + 1;
end
BetaP
N

%find the approximate solution
for i = 1:length(xVec)
    approx_soln(i) = (BetaP(1) * exp((-(xVec(i)-BetaP(2))^2)/(2*BetaP(3)^2)));
end

%plot the data
figure(1)
plot(xVec,yVec,'b.','MarkerSize',20,'LineWidth',6); hold on; % plot the data
plot(xVec,approx_soln,'r','LineWidth',4);
legend('Data','Model Fit')

end

% FUNCTION 2 that Computes the Jacobian-like matrix J
function J = compute_Jacobian(BetaP,xVec)
% begin for loop to iteration through data points
for i = 1:length(xVec)
    % partial wrt BetaP(1)
    J(i,1) = exp(-((xVec(i)-BetaP(2))^2)/(2*BetaP(3)^2));
    % partial wrt BetaP(2)
    J(i,2) = (BetaP(1)*(xVec(i)-BetaP(2))/(BetaP(3)^2)) * exp(-((xVec(i)-BetaP(2))^2)/(2*BetaP(3)^2));
    % partial wrt BetaP(3)
    J(i,3) = ((BetaP(1)*(xVec(i)-BetaP(2))^2)/(BetaP(3)^3)) * exp(-((xVec(i)-BetaP(2))^2)/(2*BetaP(3)^2));
end
end

% FUNCTION 3 that Computes dely
function dely = compute_dely(BetaP,xVec,yVec)
% begin for loop to iterate through data points
for i = 1:length(yVec)
    % compute the ith term of dely
    dely(i,1) = yVec(i) - (BetaP(1) * exp((-(xVec(i)-BetaP(2))^2)/(2*BetaP(3)^2)));
end
end