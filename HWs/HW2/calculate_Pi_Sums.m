function calculate_Pi_Sums()

%initialize N_A, N_B, error, and tolerance
N_A = 0;
N_B = 0;
err_A = 1;
err_B = 1;
tol = 1e-6;

%while loop for a_n
while err_A > tol
    %increment N_A
    N_A = N_A + 1;
    
    %initialize a_n
    a_n = 0;
    
    %compute sum for a_n
    for k = 0:N_A
        a_n = ((6/sqrt(3))*(-1)^k)/((3^k)*(2*k +1)) + a_n
    end
    
    %compare a_n to pi
    err_A = abs(a_n - pi);
end 
N_A

%while loop for b_n
while err_B > tol
    %increment N_B
    N_B = N_B + 1;
    
    %initialize b_n
    b_n = 0;
    
    %compute sum for b_n
    for k = 0:N_B
        b_n = (16*((-1)^k)/(((5^(2*k + 1))*(2*k + 1))))-(4*((-1)^k))/((239^(2*k +1))*(2*k +1)) + b_n
    end
    
    %compare b_n to pi
    err_B = abs(b_n - pi);
end 

N_A
N_B

