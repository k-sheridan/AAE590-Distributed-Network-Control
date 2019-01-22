function [] = plotResults(X, dt)
%This expects a cell array of cell array states.

% first create state vector matrices
x1 = [];
x2 = [];
x3 = [];
x4 = [];

t = (0:dt:dt*(length(X)-1));

for idx = (1:length(X))
    x1(1:3, idx) = X{idx}{1};
    x2(1:3, idx) = X{idx}{2};
    x3(1:3, idx) = X{idx}{3};
    x4(1:3, idx) = X{idx}{4};
end

subplot(1, 2, 1)
%figure('Name', 'Bearings Over Time')
hold on
plot(t, x1(3, :), 'r-')
plot(t, x2(3, :), 'g--')
plot(t, x3(3, :), 'bs-')
plot(t, x4(3, :), 'ko-')
legend('x1', 'x2', 'x3', 'x4')
title('Bearings Over Time')
xlabel('Time (s)')
ylabel('Bearing (rad)')
ylim([-pi/2, pi/2])
grid on

subplot(1, 2, 2)
%figure('Name', 'Node Trajectories')
hold on
quiver(x1(1, :), x1(2, :), cos(x1(3, :)), sin(x1(3, :)), 0)
quiver(x2(1, :), x2(2, :), cos(x2(3, :)), sin(x2(3, :)), 0)
quiver(x3(1, :), x3(2, :), cos(x3(3, :)), sin(x3(3, :)), 0)
quiver(x4(1, :), x4(2, :), cos(x4(3, :)), sin(x4(3, :)), 0)
legend('x1', 'x2', 'x3', 'x4')
title('Node Trajectories')
xlabel('x (m)')
ylabel('y (m)')
ylim([-10, 5])
xlim([-5, 30])
daspect([1, 1, 1])
grid on

