function fit_Polynomial_Series()

%amount of data points
N = 250;

xData = linspace(-2*pi, 2*pi, N);
yData = cos(xData)'; %apostrophe will make it a column vector

%We now have two vectors, xData and yData, that contain all the data we
%will use to perform our Linear Least Squares.

for i = 1:N
   x = xData(i);
   y = yData(i);
   
   %need to make a matrix to store the x's
   for j = 1:13 %there is no 0 index so we need to go from 1 to 13
    x_Matrix(i, j) = x^(j-1);
   end
   
   %need to make a vector to store the y's
    y_Vector(i, :)= y;
   
end

%use pseudo-inverse to calculate beta vector
beta_vector = inv(x_Matrix'*x_Matrix) * x_Matrix' * y_Vector;

%find function value using beta
for i = 1:N %we want to use all the x values
    
    %get all the x values
    x =xData(i);
    
   %intitialize summation vector
   f(i, 1) = 0;
   
   for j = 1:13
    
    %add to the previous term
    f(i, 1) =  f(i, 1) + (beta_vector(j) * x^(j-1));
   end
   
   %residual
   res = y_Vector - x_Matrix * beta_vector;
   
   %calculate new error
   err = sqrt(res' * res);
   
end

beta_vector

plot(xData, yData, 'blue', 'linewidth', 6);
hold on
plot(xData, f, 'red', 'linewidth', 4);
legend('Data', 'Best Poly Fit');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) Increasing N, the # of data points, changes the residual because the
% number of elements in the vector increases and these elements get closer
% and closer to 0. 
%  
%  When N = 10, the residual is 
%
%   -0.7124
%   -0.0906
%   -0.0063
%   -0.0000
%   -0.0000
%   -0.0000
%   -0.0003
%   -0.0065
%   -0.0437
%    0.1330
%
%   When N = 50, the residual is
%
%  -0.0455
%   0.1480
%   -0.0739
%   -0.1174
%   -0.0174
%    0.0817
%    0.1021
%    0.0488
%   -0.0301
%   -0.0855
%   -0.0919
%   -0.0527
%    0.0090
%    0.0640
%    0.0900
%   0.0787
%    0.0370
%   -0.0177
%   -0.0647
%   -0.0875
%   -0.0789
%   -0.0428
%    0.0077
%    0.0552
%    0.0838
%    0.0838
%    0.0552
%    0.0077
%  -0.0428
%   -0.0789
%   -0.0875
%  -0.0647
%  -0.0177
%   0.0370
%   0.0787
%   0.0900
%   0.0640
%    0.0090
%   -0.0527
%   -0.0919
%   -0.0855
%   -0.0301
%    0.0488
%   0.1021
%    0.0817
%   -0.0174
%   -0.1174
%   -0.0739
%    0.1480
%   -0.0455
%
%  When N = 250, the residual is 
%
%    -0.2406
%    -0.0401
%     0.0776
%     0.1349
%     0.1497
%     0.1362
%     0.1056
%     0.0662
%     0.0244
%    -0.0153
%    -0.0500
%    -0.0778
%    -0.0978
%    -0.1097
%    -0.1140
%    -0.1112
%    -0.1025
%    -0.0887
%    -0.0712
%    -0.0512
%    -0.0296
%    -0.0077
%     0.0137
%     0.0337
%     0.0518
%     0.0673
%     0.0799
%     0.0894
%     0.0955
%     0.0984
%     0.0981
%     0.0947
%     0.0886
%     0.0800
%     0.0694
%     0.0570
%     0.0433
%     0.0288
%     0.0138
%    -0.0013
%    -0.0160
%    -0.0301
%    -0.0433
%    -0.0552
%    -0.0656
%    -0.0744
%    -0.0813
%    -0.0864
%    -0.0895
%    -0.0907
%    -0.0899
%    -0.0873
%    -0.0829
%    -0.0769
%    -0.0695
%    -0.0607
%    -0.0509
%    -0.0402
%    -0.0288
%    -0.0171
%    -0.0051
%     0.0069
%     0.0186
%     0.0299
%     0.0405
%     0.0504
%     0.0593
%     0.0670
%     0.0736
%     0.0789
%     0.0828
%     0.0853
%     0.0864
%     0.0861
%     0.0843
%     0.0812
%     0.0769
%     0.0713
%     0.0646
%     0.0570
%     0.0485
%     0.0393
%     0.0295
%     0.0194
%     0.0090
%    -0.0015
%    -0.0119
%    -0.0221
%    -0.0319
%    -0.0412
%    -0.0499
%    -0.0578
%    -0.0648
%    -0.0709
%    -0.0759
%    -0.0798
%    -0.0825
%    -0.0840
%    -0.0844
%    -0.0835
%    -0.0815
%    -0.0783
%    -0.0740
%    -0.0687
%    -0.0624
%    -0.0553
%    -0.0474
%    -0.0389
%    -0.0298
%    -0.0204
%    -0.0107
%    -0.0008
%     0.0090
%     0.0187
%     0.0281
%     0.0372
%     0.0457
%     0.0536
%     0.0607
%     0.0671
%     0.0725
%     0.0769
%     0.0802
%     0.0825
%     0.0836
%     0.0836
%     0.0825
%     0.0802
%     0.0769
%     0.0725
%     0.0671
%     0.0607
%     0.0536
%     0.0457
%     0.0372
%     0.0281
%     0.0187
%     0.0090
%    -0.0008
%    -0.0107
%    -0.0204
%    -0.0298
%    -0.0389
%    -0.0474
%    -0.0553
%    -0.0624
%    -0.0687
%    -0.0740
%    -0.0783
%    -0.0815
%    -0.0835
%    -0.0844
%    -0.0840
%    -0.0825
%    -0.0798
%    -0.0759
%    -0.0709
%    -0.0648
%    -0.0578
%    -0.0499
%    -0.0412
%    -0.0319
%    -0.0221
%    -0.0119
%    -0.0015
%     0.0090
%     0.0194
%     0.0295
%     0.0393
%     0.0485
%     0.0570
%     0.0646
%     0.0713
%     0.0769
%     0.0812
%     0.0843
%     0.0861
%     0.0864
%     0.0853
%     0.0828
%     0.0789
%     0.0736
%     0.0670
%     0.0593
%     0.0504
%     0.0405
%     0.0299
%     0.0186
%     0.0069
%    -0.0051
%    -0.0171
%    -0.0288
%    -0.0402
%    -0.0509
%    -0.0607
%    -0.0695
%    -0.0769
%    -0.0829
%    -0.0873
%    -0.0899
%    -0.0907
%    -0.0895
%    -0.0864
%    -0.0813
%    -0.0744
%    -0.0656
%    -0.0552
%    -0.0433
%    -0.0301
%    -0.0160
%    -0.0013
%     0.0138
%     0.0288
%     0.0433
%     0.0570
%     0.0694
%     0.0800
%     0.0886
%     0.0947
%     0.0981
%     0.0984
%     0.0955
%     0.0894
%     0.0799
%     0.0673
%     0.0518
%     0.0337
%     0.0137
%    -0.0077
%    -0.0296
%    -0.0512
%    -0.0712
%    -0.0887
%    -0.1025
%    -0.1112
%    -0.1140
%    -0.1097
%    -0.0978
%    -0.0778
%    -0.0500
%    -0.0153
%     0.0244
%     0.0662
%     0.1056
%     0.1362
%     0.1497
%     0.1349
%     0.0776
%    -0.0401
%    -0.2406
% 
% b) I've seen cos(x) written as a polynomial before in Calculus B as a
% taylor series. Its coefficients are 1/(2n)! where n goes from 0 to
% infinity.
%
% c) When N = 250, I found the coefficients to be
%
%     0.9999
%     0.0000
%    -0.4998
%    -0.0000
%     0.0416
%     0.0000
%    -0.0014
%    -0.0000
%     0.0000
%     0.0000
%    -0.0000
%    -0.0000
%     0.0000
%
% d) The coefficients I found appear to be different.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%