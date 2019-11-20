function vary_StepSize_Gamma_To_Optimize()

%vector containing various gamma values
gammaVec = [0.5:0.02:1.5];

%runs through each gamma value and saves the number of iterations into a storage vector
for i = 1:length(gammaVec)
    grad_descent(i) = Gradient_Descent_1(1e-10, gammaVec(i));
end

%plot of the # of iterations vs. gamma (step-size)
semilogx(gammaVec, grad_descent, 'blue', 'Linewidth', 5);

%labels for title and legend
title('Semilog Plot For Various Gamma Values');
legend('Fixed Step');

%labels for axes
xlabel('gamma (step-size)');
ylabel('# of Iterations, N');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) The best step-size, gamma, for this particular function seems to be
% gamma = 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
