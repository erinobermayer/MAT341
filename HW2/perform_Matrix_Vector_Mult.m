function prod = perform_Matrix_Vector_Mult(A,x) %input a matrix A and a vector x, outputs a vector prod
    
    for i = 1:size(A,1)     %resulting vector should be the same length as the first dimension of A
       
        prod(i,1) = perform_Dot_Product(A(i,:)',x);     %take the dot product of each row of A with x and put it as an element in solution vector
        
    end

end