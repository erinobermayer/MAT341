%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4 Questions to answer:
%   1. The tau value that appears to be the best is 0.5. I think this
%      happens because tau is the search step, so if we move in towards the
%      midpoint of the interval, we are getting a smaller interval much 
%      faster. In this case, "best" means needing the least number of
%      iterations to converge.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function find_Best_Tau()
%create a vector of tau values
tauVec = 0.05:0.05:0.95;
%iterate through the 2nd version of Golden Search and create a vector N
%that contains the number of iterations it takes to converge for each tau
%value
for i = 1:length(tauVec)
    N(i) = v2_Golden_Search(tauVec(i));
end
%plot N vs. tauVec
plot(N,tauVec,'b','LineWidth',5)
xlabel('Number of Iterations')
ylabel('tau')
title('N vs. tau')
end