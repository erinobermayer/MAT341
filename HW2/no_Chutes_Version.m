function ct = no_Chutes_Version()   %play the game once, output the number of turns it took to win
    ct = 0;  %start with no turns
    space = 0; %start at space 0
    ladders = [1 38; 4 14; 9 31;21 42; 28 84; 36 44; 51 67; 71 91; 80 100];     %store the space values for each ladder
    while space ~= 100  %we continue until we get to space 100
        roll = ceil(rand(1)*6);     %roll a number between 1 and 6
        space = space + roll;   %move forward the number of spaces we rolled
        for i = 1:9
            if space == ladders(i,1)
                space = ladders(i,2);   %if our space is a ladder, move up
                break
            end
        end
        ct = ct+1;  %we took a turn, add to the count
        if space > 100
            space = space - roll;   %if we passed 100, go back
        end
    end
end