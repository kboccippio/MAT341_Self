function N = golden_Search(tol)

%initialize N, the number of iterations it takes to achieve the specific
%error tolerance, tol, that is inputted
N = 0;

%define tau
tau = ((sqrt(5)-1)/2);

%define interval
a = 0;
b = 2;


while (b-a) > tol 
    
    %increment N for every time while loop is entered
    N = N + 1;
    
    %x value on the left side of min
    x1 = a + ((1-tau) *(b-a));
    
    %x value on the right side of min
    x2 = a + (tau *(b-a));
    
    %first function value is greater than second function value
    if f(x1)> f(x2)
        %"chop off" left side; redefine left point
        a = x1;
    else 
        %second function value is greater than first function value
        %"chop off" right side; redefine right point
        b = x2;   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = f(x)

%equation of the function we are trying to find the minimum of
val = 0.5 - x*exp(-(x^2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) It takes 40 iterations to achieve 1e-8 accuracy. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%