function Area = Monte_Carlo_Jellyfish_Integral()
Niter = 1000;   %number of times we guess an (x,y) coordinate
load('Jellyfish_Data_MAT341.mat'); % loads matrix 'DATA'
xmax = size(DATA,1);    %number of datapoints in DATA
ymax = 3.5; %found by looking at the graph (I know that everything is less than 3.5)
ct = 0;     %initialize count of how many times our random coordinate is under the curve
for i = 1:Niter
    x = randi(xmax);  %generate a random integer x-value between 1 and 320
    y = rand(1)*ymax;        %generate a random y-value between our y bounds
    if y<(DATA(x,2))   %if our random y-value is under the curve (or our approximation of the curve)
        ct = ct+1;              %add to the count
    end
end
prob = ct/Niter;        %probability that we landed under the curve
Area = prob*(DATA(size(DATA,1),1)-DATA(1,1))*(3.5);    %the approximate integral is found by multiplying the probability by the area of the rectangular region we were guessing in