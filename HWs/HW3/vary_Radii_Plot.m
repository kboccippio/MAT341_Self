% Each of the following estimated probabilities has a 
% a corresponding r value:
%
% r = 0.15 gives the estimated probability of 0.5
% r = 0.34 gives the estimated probability of 0.1
% r = 0.45 gives the estimated probability of 0.01
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vary_Radii_Plot()

%vector containing various radii
rVec = [0.01:0.0005:0.10 0.1:0.01:0.5];

%runs through each radius and puts it into a probability matrix
for i = 1:length(rVec)
    prob(i) = estimate_Coin_In_Square_Probability(rVec(i), 1e5);
end

%plot the length of the radii verus the probability
plot(rVec, prob);

%labels for the x and y axes
xlabel('radius');
ylabel('probability');

