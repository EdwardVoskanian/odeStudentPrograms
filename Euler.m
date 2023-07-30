clc;
close all;

% We should start by defining our IVP; m = F(t,y), y(t_0) = y_0.
F = @(t,y)(t.^2 - y.^2);
t_0 = 0; y_0 = 1;

% Preallocate an array for N + 1 time values starting with t_0 and ending
% with T.
N = 100; 
T = 10; 
times = zeros(1,N + 1);

% A loop for generating the N + 1 equally spaced time values.
Dt = (T - t_0)/N;
times(1) = t_0;
for k = 1:N + 1
    t_k = t_0 + (k - 1)*Dt;
    times(k) = t_k;
end

% Preallocate an array for N + 1 values starting with y(t_0) = y_0.
% Eventually, this array will be populated with ``very good'' guesses for
% y(t_1), y(t_2), ..., y(T). 
values = zeros(1,N + 1);
values(1) = y_0;
for k = 2:N + 1
    values(k) = values(k - 1) + F(times(k - 1),values(k - 1))*Dt;
end

% By plotting times vs values, we get an approximate solution to the IVP.
plot(times,values)