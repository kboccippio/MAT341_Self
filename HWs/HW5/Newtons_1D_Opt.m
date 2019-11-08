function val = Newtons_1D_Opt(tol)

%initial guess 
xn = 0.25;

%initialize N, the number of iterations it takes to achieve the specific error
%tolerance that is inputted
N = 0;

while abs(first_deriv(xn)) > tol
    
    %increment the number of iterations
    N = N + 1;
    
    %redefine xn
    xn = xn - (first_deriv(xn)/second_deriv(xn));
end

val = xn
N
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = first_deriv(xn)
    
%first derivative
val = exp(-xn^2)*((2*xn^2) - 1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = second_deriv(xn)

%second derivative
val = 2*xn*exp(-xn^2)*((-2*xn^2)+3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) It takes 5 iterations to achieve 1e-8 accuracy with the inital guess
%of 0.25
%
%(b) When the initial guess was changed to 1.5, the program took 16
%iterations to run, and it also found a different minimum of 4.7120.
