% Define initial conditions

g = 9.81;     % Acceleration due to gravity (m/s^2)
h_0 = 10;     % Initial height (m)
v_0 = 0;      % Initial velocity (m/s)
k = 0.8;      % Coefficient of restitution

% Define a time vector,t, which specifies the simulation time in seconds. It goes from 0 to 5 seconds in increments of 0.01 seconds

t = 0:0.01:5; % Simulation time in seconds


% Initialize position and velocity vectors, with the same size as the time vector t

y = zeros(size(t)); 
v = zeros(size(t));
y(1) = h_0; % first element of vector y is set to the initial height of the ball
v(1) = v_0; % the first element of v is set to the initial velocity of the ball


% Simulate the motion of the ball

for i = 2:length(t) % Loop starts at i = 2 because the initial position and velocity of the ball were already set outside the loop
    % Update the position and velocity of the ball integrating the equations of motion
    y(i) = y(i-1) + v(i-1)*0.01 - 0.5*g*0.01^2;
    v(i) = v(i-1) - g*0.01;
    
    % Check if the ball has hit the ground
    if y(i) < 0
        % Update the position and velocity of the ball after bouncing
        y(i) = -k*y(i-1);
        v(i) = -k*v(i-1);
    end
end

% Position vs time plot
figure;
plot(t,y);
xlabel('Time (s)');
ylabel('Position (m)');
title('Bouncing Ball Trajectory Plot');

% Velocity vs time plot
figure;
plot(t,v);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Bouncing Ball Velocity Profile');

