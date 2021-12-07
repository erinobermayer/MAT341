function coin = flip_coin()

    flip = rand(1);     %returns a random number between [0,1]

    if flip <= 0.5
        coin = 0;       % if number is less than 0.5, we call it tails (0) 
    elseif flip > 0.5
        coin = 1;       % if number is greater than 0.5, we call it heads (1) 
    end

end