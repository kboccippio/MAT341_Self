function N = Newtons_2D_Opt(tol)

%initialize N, the number of iterations
N = 0;

%initialize guess, vector, and error
x0 = [-4.5; 4.5];
x1 = [0; 0];
err = 1;

while err > tol
    
    %increment the number of iterations
    N = N +1;
    
    %redefine x1 using our initial guess, the Hessian matrix, and the
    %gradient
    x1 = x0 - H(x0(1), x0(2)) * grad(x0(1), x0(2));
    
    %redefine error
    err = sqrt(((x1 - x0).') * (x1 - x0));
    
    %redefine x0 by setting it equal to x1
    x0 = x1;
end
N
val = x0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = H(x, y)      

%Hessian function
val = inv([sin(x) 0; 0 cos(y)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = grad(x,y)        

%gradient function
val = [-cos(x); sin(y)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) With the initial guess above, it took 5 iterations to find a minimum
% with an error tolerance of 1e-8. The minimum it found was (-4.7124, 0).
%
% (b) When the inital guess was changed to (-4.5, 4.5), the minimum
% remained the same at (-4.7124, 0), but this time it only took 4 iterations. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%