close all
clc

% Initial conditions [predator,prey]
x0 = [4;4];
tspan = [0;50];
[t,x] = ode45(@(t,x)F(t,x),tspan,x0);

subplot(3,1,1);
plot(t,x(:,1));
xlabel('t');
ylabel('Predator');

subplot(3,1,2);
plot(t,x(:,2));
xlabel('t');
ylabel('Prey');

subplot(3,1,3);
plot(t,x(:,1));
hold on
plot(t,x(:,2));


function dx = F(t,x)
% Proportionality constants
a = 0.16; b = 0.08; c = 4.5; d = 0.9;
% Predator
x_1 = x(1);
% Prey
x_2 = x(2);
dx = zeros(2,1);
dx(1) = -a*x_1 + b*x_1*x_2;
dx(2) = c*x_2 - d*x_1*x_2;
end



