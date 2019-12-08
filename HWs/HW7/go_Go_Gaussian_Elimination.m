function OpCount = go_Go_Gaussian_Elimination(N)

%initialize random square matrix A
A = rand(N, N);

%initialize counter
OpCount = 0;

%Reduced Echelon Form%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m = 1:N
    
    %divide row by the coefficient in the diagonal
    for i = 1:N
       A(m, i) = A(m, i) / A(m, m);
        
        %increment counter
        OpCount = OpCount + 1;
    end
    
     %subtraction of rows to make the numbers below the diagonal become zero
     for j = 1:N
         for k = (m+1):N
             A(k, j)= A(k, j) - A(k, m) * A(m, j);
             
             %increment counter by 2
             OpCount = OpCount + 2;
         end
     end
end

%Row-reduced Echelon Form %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1:N-1 % runs through each row
    for i = 2:N  %runs through each column
        if A(j, i) ~= 1 
            A(j, i) = A(j, i) - A(j, i) * A (i, i);
            
            %increment operation count
            OpCount = OpCount + 1;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) As the size of my matrix increases, the number of operations also
% increases. It appears linear because the relationship between the
% dimensions of the matrix and the number of operations is contant, thus
% linear.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%