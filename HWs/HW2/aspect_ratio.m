function aspect_ratio()

Lx = [1:1:10 20:5:100 150:50:1000 1500:500:10000 15000:5000:1e5];
Ly = 1;
n = 1e5;

for i = 1: length(Lx)
    exp_dist(i) = point(Lx(i), Ly, n);
    AR(i) = Lx(i);
end

loglog(AR, exp_dist, 'r*');
xlabel('expected distance');
ylabel('aspect ratio');