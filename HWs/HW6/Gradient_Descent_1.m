function N = Gradient_Descent_1(tol, gamma)

%initialize N, the number of iterations
N = 0;

%initial point
A = [1.0; 1.5];

%initialize error
err = 1;

while err > tol
    
    %increment the number of iterations
    N = N +1;
    
    %define vector B
    B = A - gamma * grad(A);

    %redefine error
    err = sqrt(((B - A).') * (B - A));
    
   %redefine A
    A = B;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = grad(A)        

%gradient function
val = [-cos(A(1)); sin(A(2))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) It takes 35 iterations to acheive 1e-10 accuracy using gamma = 0.5.
%
% (b) It takes 12 iterations to achieve 1e-10 accuracy using gamma = 0.9.
%
% (c) It takes 34 iterations to acheive 1e-10 accuracy using gamma = 1.5.
