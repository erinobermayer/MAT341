function AB = perform_Matrix_Matrix_Mult(A,B)   %inputs two matrices A and B, outputs one matrix AB

    for i = 1:size(A,1)     %resulting matrix AB should have same number of rows as A
        
        for j = 1:size(B,2)     %resulting matrix AB should have the same number of columns as B
       
            AB(i,j) = perform_Dot_Product(A(i,:)',B(:,j));  %take the dot product of row i of A and column j of B, that becomes element (i,j) of matrix AB
            
        end
        
    end

end