function plot_Gaussian_Elimination_Scaling()

%vector that runs through various N values
NVec = [2:1:100];

%runs through each N value and saves the number of arithmetic operations into a storage vector
for i = 1:length(NVec)
    gauss(i) = go_Go_Gaussian_Elimination(NVec(i));
end

%plot of the operation count vs. size of the matrix, N
% using logarithmic axis in both the vertical and horizontal directions
figure(1); loglog(NVec, gauss, 'blue', 'linewidth', 5);

%axes labels & title
xlabel('Size of the Matrix, N');
ylabel('Operation Count');
title('Logarithmic Plot')

%plot of the operation count vs. size of the matrix, N
% using NO logarithmic axes
figure(2); plot(NVec, gauss, 'blue', 'linewidth', 5);

%axes labels & title
xlabel('Size of the Matrix, N');
ylabel('Operation Count');
title('Non-logarithmic plot');