%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: Find the best fit coefficients for a cubic through 
%               the {(x,y)} that gets loaded.
%
%   AUTHOR: 
%     DATE:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Activity_CUBIC_Linear_Least_Squares()

%------------------------------------------------------------
%
% LOADS a .mat file which hands you a matrix, DATA
%   
%       NOTE: (1) DATA(:,1) <- x values (1st column)
%             (2) DATA(:,2) <- y values (2nd column)
%
%------------------------------------------------------------
load('CUBIC_Students_Linear_Least_Squares.mat');

% *** CAN USE MATRIX DATA BELOW AS THOUGH YOU CREATED IT 
%       PREVIOUSLY  ONCE YOU LOAD IT IN THE PREVIOUS LINE ****

xVec = DATA(:,1); % grabs x-Values from DATA
yVec = DATA(:,2); % grabs y-Values from DATA.

A = [ones(length(xVec),1) xVec xVec.^2 xVec.^3];

beta = inv(A'*A)*A'*yVec


figure(1)
plot(xVec,yVec,'.'); hold on;
plot(xVec,A*beta,'.')
legend('{(xj,yj)} data','linear approximation')