close all
clc

% Parameters: g is the gravitational constant, c is the damping
% coefficient, l is the length of the string, and m is the mass of the
% pendulum bob. Note that mass only matters with damping.
g = 9.81;
c = 3;
l = 1;
m = 1;

% This is where you define you IVP
F = @(t,y)([y(2); -4*y(1) - 0.25*y(2) + 2*cos(3*t)]);
y_0 = [1 -2];
tspan = [0 100];
[tout,stateout] = ode45(F,tspan,y_0);

% Let's first look at the phase plane, which is just a name for the plane 
% where are solutions are drawn. Now that we have turned our problem into 
% a matrix equation, our solutions are parametrized curves in the plane. 
% In our setting with the pendulum, the horizonatal axis is the position 
% theta of the pendulum, and the vertical axis is the velocity d(theta)/dt 
% of the pendulum. Interesting way to visualize solutions right?  
% figure(1)
% plot(stateout(:,1),stateout(:,2))

%Open a figure and crate the axes
figure(2)
axes;
%
% STEP 1:
%
% Create and open the video object
videoObject = VideoWriter('PendSim.avi');
open(videoObject);
%
% Loop over the data to create the video
theta_1 = stateout(:,1);
theta_2 = stateout(:,2);

for j = 1:length(theta_1)
    plot([0 m*sin(theta_1(j)) m*sin(theta_2(j)) + m*sin(theta_1(j))],[0 -m*cos(theta_1(j)) -m*cos(theta_2(j)) + -m*cos(theta_1(j))])
    set(gca,'xlim',[-2.5 2.5],'ylim',[-1.5 1.5])
    % Get the current frame
    currFrame = getframe;
    % Write the current frame
    writeVideo(videoObject,currFrame);
end
pbaspect([1 1 1])

% Close (and save) the video object
close(videoObject);







