function probability_chutes_And_Ladders() 
    N = 500000;      %N is the number of times we play the game
    ctVec = zeros(500,1);   %this vector will keep track of the frequency of each number of turns it took to win
    for i = 1:N
        playGame = chutes_And_Ladders();    %play the game and get the number of turns it took
        ctVec(playGame,1) = ctVec(playGame,1)+1;    %add a game to that count number
    end
    prob = ctVec./N;    %finds the probability of each number and saves it in a new vector
    numTurns = 1:1:length(ctVec);
    figure(1)
    plot(numTurns,prob,'LineWidth',5,'MarkerSize',10)       %plot the distribution function, changing LineWidth and MarkerSize
    xlabel('# of turns until win')      %label the axis
    ylabel('Probability')
    title('Probability Distribution for Chutes and Ladders')       %title the graph
end