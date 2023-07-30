close all
clc

% Start by specifying the parameters: mass m, spring constant k, damping
% coefficient c.
m = 1; k = 1; c = 0;

% Now we define an IVP in two steps: 

% STEP 1: convert the second-order equation 
% u'' + (c/m)u' + (k/m)u = b 
% into a system of two first-order equations. We do this by introducing 
% two dependent variables. The first one we call x(1), and the second one 
% we call x(2). Let x(1) = u, and let x(2) = u'. Then x(1)' = u' = x(2), 
% and x(2)' = u''. Finally, by solving the second-order equation for u'', 
% we get x(2)' = b - (c/m)x(2) - (k/m)x(1).
F = @(t,x)[x(2);sin(t) - (c/m)*x(2) - (k/m)*x(1)];

% STEP 2: specify the initial values.
position = 0; velocity = -1; 
x_0 = [position,velocity];

% Now we are ready to use ODE45 to numerically solve our IVP.
N = 50;
tspan = [0,N];
[t,x] = ode45(F,tspan,x_0);
pos = x(:,1); vel = x(:,2);

figure(1)
plot(t,pos)

figure(2)
plot(pos,vel)

pbaspect([1 1 1]);

% Uncomment this bit of code to see a moving box.
% figure(3)
% timestep = length(pos);
% fr = 1;
% for t = 1:timestep
%     cla
%     plot(0,pos(fr),'s','MarkerSize',50)
%     axis([-1 1 -1 1])
%     drawnow
%     M(fr) = getframe;
%     fr = fr + 1;
% end