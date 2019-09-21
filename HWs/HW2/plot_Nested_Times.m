function plot_Nested_Times()

% vector of N-values
N = [1:1:10 20:10:100 125 150 175 200 225 250];

for i = 1:length(N)
    
    % line that is being plotted
    time(i)= calculate_Nested_For_Loop_Time(N);
    
end

% plotting the line
loglog(N, time, 'magenta' , 'linewidth', 5);

% labels for x and y axes
xlabel('N');
ylabel('Time');

%title
title('Nested For Loop Times')
    
