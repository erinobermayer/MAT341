function dotProduct = perform_Dot_Product(u,v)  %input two vectors u and v, output a scalar dotProduct
    
    %transpose of u
    u = u';

    %initialize dotProduct as 0
    dotProduct = 0;
    
    for i = 1:length(u)
        dotProduct = dotProduct + u(1,i)*v(i);    %add multiplications up
    end
    
end

    
    