function numflips = hhheads()

coin1 = flip_coin();    %flip the first coin
coin2 = flip_coin();    %flip the second coin
numflips = 2;           %count the first two flips

numheads = 0;           %set an initial value for the number of heads

while numheads ~= 3     %continue iterating until we get 3 heads
    
    coin3 = flip_coin();    %flip our third coin
    
    numheads = coin1 + coin2 + coin3;    %in each iteration, update the sum of the 3 coins
    
    coin1 = coin2;      %coin 1 for next iteration becomes previous coin 2
    coin2 = coin3;      %coin 2 for next iteration becomes previous coin 3
    numflips = numflips + 1;    %keep track of the number of flips (add one each iteration)
    
end