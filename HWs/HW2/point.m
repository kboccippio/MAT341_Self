function avg = point(Lx, Ly, n)

dist = 0;
for i = 1:n
    dist = pick_points(Lx, Ly) + dist;
end

avg = dist/n;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dist = pick_points(Lx, Ly)

x1 = Lx*rand();
x2 = Lx*rand();
y1 = Ly*rand();
y2 = Ly*rand();

dist = sqrt((y2 - y1)^2 + (x2 - x1)^2);


