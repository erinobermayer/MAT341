function Area = Monte_Carlo_Integral()
Niter = 1000;   %number of times we guess an (x,y) coordinate
a = 0;         %lower bound of integral
b = 1;      %upper bound of integral
min = 0;    %minimum y-value of function
max = 1;    %max y-value of function     
ct = 0;     %initialize count of how many times our random coordinate is under the curve
for i = 1:Niter
    x = rand(1)*(b-a)+a;  %generate a random x-value between our x bounds
    y = rand(1)*(max-min)+min;        %generate a random y-value between our y bounds
    if y<(exp(-x^2)*(cos(2*x))^2)   %if our random y-value is under the curve
        ct = ct+1;              %add to the count
    end
end
prob = ct/Niter;        %probability that we landed under the curve
Area = prob*(b-a)*(max-min);    %the approximate integral is found by multiplying the probability by the area of the rectangular region we were guessing in