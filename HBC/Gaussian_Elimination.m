function A_rref = Gaussian_Elimination(A) %assume A is nxn


%%START WITH 3x3

    %goal: go through each row, find first nonzero element, scale row so first element is 1
    for i = 1:size(A,1)     %iterate through each row
        for j = 1:size(A,2)     %iterate through each column
            if A(i,j) ~= 0      %check to see if first element equals 0
                val = A(i,j);      %value of first element in row
                A(i,:) = (1/val)*A(i,:);    %scale row so first element is 1
                break       %if we scaled this row, now exit for loop of columns and move to the next row
            end
        end
    end
    %at this point, the first element of every row should be 1
                
    if A(1,1) == 0           
    for i = 2:size(A,1)
        if A(i,1) == 1  %if another row has a zero as the first entry, switch it with R1
            R1 = A(1,:);    %set first row as R1
            A(1,:) = A(i,:);    %redefine row 1 as row i
            A(i,:) = R1;    %redefine row i as R1
            
            %next, we have to 
            
        end
        
    end

end