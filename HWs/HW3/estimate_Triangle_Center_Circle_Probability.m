function prob = estimate_Triangle_Center_Circle_Probability(N)

%initialize counter
contains_zero = 0;

%for loop to run through all the trials
for i = 1:N
    
    %calls function to assign the triangle in the circle
    angle_in_circle = triangle_points(N);
     
     %checks whether or not the origin is contained in the triangle
    if angle_in_circle(2) > (angle_in_circle(3) - pi) && angle_in_circle(2) < (angle_in_circle(1) + pi)
        contains_zero = contains_zero + 1;
    end
end

%calculates the probability of the triangle containing the origin
prob = contains_zero/ N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function three_angles = triangle_points(N)

%random values of angles between [0, 2*pi]
angle(1) = 2 * pi * rand();
angle(2) = 2 * pi * rand();
angle(3) = 2 * pi * rand();

%sorts the angles as min, middle, or max
for i = 1:3
    if angle(i) == max(angle)
        max_angle = angle(i);
    elseif angle(i) == min(angle)
            min_angle = angle(i);
    else middle_angle = angle(i);
    end
end

%makes a matrix with angles ordered from smallest to largest
three_angles = [min_angle middle_angle max_angle];
