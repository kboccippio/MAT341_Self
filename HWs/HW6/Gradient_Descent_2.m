function N = Gradient_Descent_2(tol)

%initialize N, the number of iterations
N = 0;

%initial point
A = [1.0; 1.5];

%initialize gamma
gamma = 0.5;

%initialize error
err = 1;

while err > tol
    
   %increment the number of iterations
   N = N +1;
   
   %define vector B
   B = A - gamma * grad(A);

   %redefine error
   err = sqrt(((B - A).') * (B - A));
   
   %redefine gamma
   gamma = abs((B-A).'*(grad(B)-grad(A)))/((grad(B)-grad(A)).' * (grad(B)-grad(A)));
    
   %redefine A
    A = B;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = grad(A)        

%gradient function
val = [-cos(A(1)); sin(A(2))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) It takes 6 iterations to achieve 1e-6 accuracy using the
% Barzilai-Borwein step-size.
%
% (b) It takes 7 iterations to achieve 1e-10 accuracy using the
% Barzilai-Borwein step-size.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

