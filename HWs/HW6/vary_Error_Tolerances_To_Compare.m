function vary_Error_Tolerances_To_Compare()

%vector containing various error tolerances
errTolVec = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-11];

%runs through each error tolerance and saves the number of iterations into a storage vector
for i = 1:length(errTolVec)
    grad_desc_1(i) = Gradient_Descent_1(errTolVec(i), 1.2); 
    grad_desc_2(i) = Gradient_Descent_2(errTolVec(i));
end

%plot of the error tolerances vs. the number of iterations N
%uses logarithmic axis in the horizontal direction only
figure(1); semilogx(errTolVec, grad_desc_1, 'blue', errTolVec, grad_desc_2, 'red', 'Linewidth', 5);

%title and legend for the first plot
title('Semilog Plot');
legend('Fixed Step', 'Barzilai-Borwein');

%labels for axes on first plot
xlabel('Error tolerance (tol)');
ylabel('Number of iterations (N)');

%plot of the error tolerances vs. the number of iterations N
%uses logarithmic axis for both the horizontal and vertical directions
figure(2); loglog(errTolVec, grad_desc_1, 'blue', errTolVec, grad_desc_2, 'red', 'Linewidth', 5);

%title and legend for the second plot
title('Loglog Plot')
legend('Fixed Step', 'Barzilai-Borwein');

%labels for axes on second plot
xlabel('Error tolerance (tol)');
ylabel('Number of iterations (N)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) The Fixed Step algorithm appears to converge faster to the minimum.
%
% (b) If you change the fixed step-size to gamma = 0.5, the
% Barzilai-Borwein algorithm converges faster.
%
% (c) By using the Barzilai-Borwein step-size, we redefine gamma each time
% we run through the while loop, thus generally this method will converege
% faster.
%
% (d) If I were to modify my code to minimize a different function, f(x,y),
% I would use the Barzilai-Borwein step-size because we will redefine the
% gamma after each iteration, helping us reach converegence faster (in most
% cases). 