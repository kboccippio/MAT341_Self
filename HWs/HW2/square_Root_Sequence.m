function val = square_Root_Sequence(m,n)

%initialize val
val = sqrt(m);

for j = 2:n
    
    %two cases: n is even or n is odd
    if mod(n,2)==0
        
       %initial sign is negative
        sgn = -1;
    else
        
        %intial sign is positive
        sgn = 1;
    end
    
    %gives current value
    val = sqrt(m+((-1)^j)*sgn*val);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For m = 13, the limit is 3
% For m = 31, the limit is 5
% For m = 43, the limit is 6
    