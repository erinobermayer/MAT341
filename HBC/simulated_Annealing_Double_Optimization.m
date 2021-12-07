function simulated_Annealing_Double_Optimization()

rng(30)

%load .MAT file
% N: # of cities
% A: cost matrix
% DistMAT: distance matrix
load('Cost_and_Distance_Matrix.mat')

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % INITIALIZE HYPERPARAMETERS & OTHER PARAMETERS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %initialize guess of random (randperm)
    %v = 1:1:1000;
    v = randperm(1000);
    %initialize fraction that we will decrease temp after each iteration of
    %steps I and II
    frac = 0.975;
    %initialize tolerance (min temp)
    tol = 1e-3;
    %initialize starting temp
    temp = 1e3;
    %parameter K (Boltzmann-like)
    K = 0.01;
    Kd = 0.00005;
    %set the maximum number of iterations to run steps I and II
    max_iter = 10000;
    %find initial cost
    cost = 0;
    dist = 0;
    for i = 1:length(v)-1
    	id1 = v(i);
        id2 = v(i+1);
        cost = cost + A(id1,id2);
        dist = dist + DistMAT(id1,id2);
    end
    %start count
    ct = 0;
    %weights for how much we care about each (cost and distance)
    goodDelC = 0.001;   %limiting value for accepting good change in cost (when change in dist is bad)
    badDelD = 99;    %limiting value for accepting bad dist change (when change in cost is good)
    goodDelD = 99;   %limiting value for accepting good change in dist (when change in cost is bad)
    badDelC = 0.001;     %limiting value for accepting bad cost change (when change in dist is good)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BEGIN WHILE LOOP FOR STEPS I AND II 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while temp > tol
        %run steps I and II for max number of iterations
        for n = 1:max_iter
            %make a random change for initial guess (switch two places)
            %pick a random number in v
            num = randi(999); 
            first = v(num);
            second = v(num+1);
            v_change = v;
            v_change(num+1) = first;
            v_change(num) = second;
            %compute new cost
            new_cost = 0;
            new_dist = 0;
            for i = 1:length(v)-1
                id1 = v_change(i);
                id2 = v_change(i+1);
                new_cost = new_cost + A(id1,id2);
                new_dist = new_dist + DistMAT(id1,id2);
            end
            %compute delC = new cost - prev cost
            delC = new_cost - cost;
            delD = new_dist - dist;
            %if delC < 0, it is a good change to make (& update cost)
            if delC < 0 && delD < 0
                v = v_change;
                cost = new_cost;
                dist = new_dist;
            elseif delC < 0 && abs(delC/cost)*100 > goodDelC && delD/dist*100 < badDelD
                v = v_change;
                cost = new_cost;
                dist = new_dist;
            elseif delD < 0 && abs(delD/dist)*100 > goodDelD && delC/cost*100 < badDelC
                v = v_change;
                cost = new_cost;
                dist = new_dist;
            %elseif rand() < exp(-delC/(K*temp)) keep change (& update
            %cost)
            elseif delC > 0 && rand() < exp(-delC/(K*temp))
                v = v_change;
                cost = new_cost;
                dist = new_dist;
            elseif delD > 0 && rand() < exp(-delD/(Kd*temp))
                v = v_change;
                cost = new_cost;
                dist = new_dist;
            end
            %add to count
            ct = ct + 1;
            %store cost in a vector to keep track 
            costVec(ct) = cost;
            distVec(ct) = dist;
        end
        %update temperature
        temp = frac * temp;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PLOT CT VS COSTVEC 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(1)
    plot(1:ct,costVec)
end