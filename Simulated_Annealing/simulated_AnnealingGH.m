function simulated_AnnealingGH()

rng(30)

load('Cost_Matrix.mat')

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
    %set the maximum number of iterations to run steps I and II
    max_iter = 10000;
    %find initial cost
    cost = 0;
    for i = 1:length(v)-1
    	id1 = v(i);
        id2 = v(i+1);
        cost = cost + A(id1,id2);
    end
    %start count
    ct = 0;
    
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
            for i = 1:length(v)-1
                id1 = v_change(i);
                id2 = v_change(i+1);
                new_cost = new_cost + A(id1,id2);
            end
            %compute delC = new cost - prev cost
            delC = new_cost - cost;
            %if delC < 0, it is a good change to make (& update cost)
            if delC < 0
                v = v_change;
                cost = new_cost;
            %elseif rand() < exp(-delC/(K*temp)) keep change (& update
            %cost)
            elseif rand() < exp(-delC/(K*temp))
                v = v_change;
                cost = new_cost;
            end
            %add to count
            ct = ct + 1;
            %store cost in a vector to keep track 
            costVec(ct) = cost;
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