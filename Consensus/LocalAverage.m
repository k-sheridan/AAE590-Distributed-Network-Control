% Local Averaging Simulation for 2D Flocking
% Author: Kevin Sheridan
clear
% The state consists of angle bearings for the 4 nodes.
% NOTE: this implementation does not handle the fact that n*2pi = (n+1)*2pi
% x_i \in R^2 X S1
x1 = [0; 0; pi/4];
x2 = [-1; 0; -pi/4];
x3 = [-2; 1; pi/4];
x4 = [-2; -1; -pi/4];

x = {x1, x2, x3, x4};

% edge list for an undirected graph
adj = [1, 1, 0, 0;
    1, 1, 1, 1;
    0, 1, 1, 1;
    0, 1, 1, 1];

% create the A matrix. x(t+1) = A*x(t)
A = [adj(1, :) / sum(adj(1, :));
    adj(2, :) / sum(adj(2, :));
    adj(3, :) / sum(adj(3, :));
    adj(4, :) / sum(adj(4, :));]

%set speed. This is the forward velocity of all nodes.
speed = 2; % m/s

% set dt
dt = 1;
tf = 10;

% state array (stores the states over time for plotting)
X = {x};

% run the algorithm
idx = 1;
for t = (0:dt:tf)
    % run motion update
    x0 = X{idx};
    xnew = x0;
    
    for node = (1:4)
        xnew{node}(1:2) = xnew{node}(1:2) + speed * [cos(xnew{node}(3)); sin(xnew{node}(3))];
    end
    
    % run consensus update
    u = A*[xnew{1}(3); xnew{2}(3); xnew{3}(3); xnew{4}(3)];
    xnew{1}(3) = u(1);
    xnew{2}(3) = u(2);
    xnew{3}(3) = u(3);
    xnew{4}(3) = u(4);
    
    idx = idx + 1;
    X{idx} = xnew;
end

plotResults(X, dt)


