function N = successive_Parabolic_Interpolation(tol)

%inital points
x1 = 0;
x2 = 0.6;
x3 = 1.2;

%initialize N, the number of iterations it takes to achieve the specific
%error tolerance, tol, that is inputted
N = 0;

while abs(x3 - x1) > tol
    
    %increment N
    N = N + 1;
    
    %matrix with the quadratic equations
    A = [(x1)^2, x1, 1, f(x1); (x2)^2, x2, 1, f(x2); (x3)^2, x3, 1, f(x3)];
  
    %row-reduced matrix
    B = rref(A);
    
    %set xMin to be the x-coordinate of the vertex of the parabola
    xMin = -B(2,4)/(2*B(1,4));
    
    %redefine the points
    x3 = x2;
    x2 = x1;
    x1 = xMin;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = f(x)

%equation of the function we are trying to find the minimum of
val = 0.5 - x*exp(-(x^2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) It takes 7 iterations to achieve 1e-8 accuracy.
%
% b) The number of iterations changed significantly when the initial value
% of x3 was changed to 2 (the number of iterations changed to 186). 
% MATLAB did not issue any warnings. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
