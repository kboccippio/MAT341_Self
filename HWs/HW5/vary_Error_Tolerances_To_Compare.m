function vary_Error_Tolerances_To_Compare()

%vector containing various error tolerances
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12];

%runs through each error tolerance and saves the number of iterations into a storage vector
for i = 1:length(errTolVec)
    golden(i) = golden_Search(errTolVec(i));
    parabolic(i) = successive_Parabolic_Interpolation(errTolVec(i));
    newton(i) = Newtons_1D_Opt(errTolVec(i));
end

%plot of the error tolerances vs. the number of iterations N
%uses logarithmic axis in the horizontal direction only
figure(1); semilogx(errTolVec, golden, 'blue', errTolVec, parabolic, 'red', errTolVec, newton, 'black', 'Linewidth', 5);

%title and legend for the first plot
title('Semilog Plot')
legend('Golden Search', 'Succ. Para. Interp.', 'Newton Method');

%labels for axes on first plot
xlabel('Error tolerance (tol)');
ylabel('Number of iterations (N)');

%plot of the error tolerances vs. the number of iterations N
%uses logarithmic axis for both the horizontal and vertical directions
figure(2); loglog(errTolVec, golden,'blue', errTolVec, parabolic, 'red', errTolVec, newton, 'black','Linewidth', 5);

%title and legend for the second plot
title('Loglog Plot')
legend('Golden Search', 'Succ. Para. Interp.', 'Newton Method');

%labels for axes on second plot
xlabel('Error tolerance (tol)');
ylabel('Number of iterations (N)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) It appears that the Newton's method algorithm
% converges faster to the mininum for less accurate tolerances.
%
% (b) When you increase the accuracy threshold, Newton's method still
% converges quicker than the other two algorithms. 
%
% (c) The convergence rates depend on how much information about the
% functions is used to get started. For instance, Newton's method converged
% faster because we were able to use the first and second derivative. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%