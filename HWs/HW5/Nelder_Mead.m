function N = Nelder_Mead(tol)

%initialize N, the number of iterations
N = 0;

%store x and y values into a vector
A = [0.35 2.8; 4 4; 4.5 4.5];  

%new vector with function values
B = [f(A(1,:)), f(A(2,:)), f(A(3,:))];

%sort function values
[fNew, indsVec] = sort(B);

%reassess x values in order from least to greatest according to
%function values
x1 = A(indsVec(1),:);
x2 = A(indsVec(2),:);
x3 = A(indsVec(3),:);

%redefine B with new function values
B = [f(x1), f(x2), f(x3)];

while abs(B(1)-B(3)) > tol
    %increment the number of iterations
    N = N +1;
    
    %compute midpoint vector between x1 and x2
    xMidpoint = 0.5*(x1 + x2);
    
    %compute a "reach vector"
    xReach = xMidpoint + (xMidpoint - x3);
 
    if f(xReach) < f(x3)
        %if the function value of the reach vector is less than that of the
        %x3 vector, set x3 equal to xReach
        x3 = xReach;
      
    elseif f(xReach) >= f(x3)
        %if the function value of the reach vector is greater than or equal
        %to that of the x3 vector, define a new vector, xC, which is the
        %midpoint of the previous midpoint and the x3 vector
        xC = 0.5 * (xMidpoint + x3);
       
        if f(xC) < f(x3)
            %if the function value of the xC vector is less than that of
            %the x3 vector, set x3 equal to xC
            x3 = xC;
        else 
            %shrink triangle in direction of x1
            x2 = (1/2)*(x1 + x2);
            x3 = (1/2)*(x1 + x3); 
        end
    end
    
    %vector with new function values
    B = [f(x1) f(x2) f(x3)];
   
    %redefine A with new x values
    A = [x1; x2; x3];
            
    %sort function values
    [fNew, indsVec] = sort(B);
    
    %reassess x values in order from least to greatest according to
    %function values
    x1 = A(indsVec(1),:);
    x2 = A(indsVec(2),:);
    x3 = A(indsVec(3),:);
    
    %redefine B with new function values
    B = [f(x1) f(x2) f(x3)];
end
  
N
val = x1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = f(A)

%given function
val = -(sin(A(1)) + cos(A(2)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (a) Using the initial points above, it takes 37 iterations to achieve
% 1e-8 acccuracy.
%
% (b) From initial points listed above, it appear to be converging to the
% point (1.5709, -0.0001). The true (x,y) value where the minimum is located
% is (pi/2, 0). This does not look like 1e-8 accuracy
% because the computer program only allows us to use iterative
% approximations to arrive at a solution. 
%
% (c) When changing the second initial point to (1.75, 0.10), it took 59
% iterations to achieve 1e-8 accuracy. It located a minimum at (1.5707,
% 0.001). Although this changed point was put closer to the local minimum,
% the number of iterations increased because different triangles were made
% to approximate where the minimum was. 
%
% (d) After changing the second and third initial points, the algorithm
% found a minimum at (-4.7124, -0.001).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
