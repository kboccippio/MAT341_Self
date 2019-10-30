function estimated_points_distance()

nVec = [1:1:10 20:5:100 150:50:1000 1500:500:10000 15000:5000:1e5];

for i = 1: length(nVec)
    dist(i) = point(nVec(i));
end

loglog(nVec, dist, 'r*');
xlabel('n');
ylabel('average distance');
