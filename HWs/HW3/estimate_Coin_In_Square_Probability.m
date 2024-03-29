% N = 1e5 does seem like a reasonable amount of trials.
% When we try to use higher values of N, the program takes
% too long to run. 
%
% This problem is more difficult than the "coin flip" case we
% did in class because we don't know what the probability is going
% to be. With the "coin flip" case, we knew the
% probability was 0.5, but here the probability was unknown beforehand. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Coin_In_Square_Probability(r,N)

%initialize counter
in_square = 0;

%for loop to run through all the trials
for i = 1:N
   
    %calls function to do the coin toss
    est_coin = coin_toss();
   
    %checks whether or not the coin is fully within the square
    if est_coin(1) > r && est_coin(1) < (1-r) && est_coin(2) > r && est_coin(2) < (1-r)
      
        %increments counter by 1
        in_square = in_square + 1;
    end
end

%calculates probability of coin landing in the square
prob = in_square/N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function coordinates = coin_toss()

%coordinates for center of circle
x = rand();
y = rand();
    
%matrix to store the x and y values
coordinates = [x y];

