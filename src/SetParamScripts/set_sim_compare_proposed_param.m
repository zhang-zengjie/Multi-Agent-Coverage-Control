%% Configure the parameters here
% Set simulation configuration
dt = 0.05;          % Time step
EndTime = 500;
nAgent = 6;         % The number of agents
w0 = 0.8.*ones(1,nAgent);    % Desired orbital velocity (rad/s) 
v0 = 40.*ones(1,nAgent);     % Constant heading velocity (m/s)

% Region Configuration
region_width = 800;
region_height = 600;

% Controller Parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 0.1;       % Control gain gamma
eps = 2;       % Epsilon of the sigmoi function
controller = "BLF";
plot_size = 240;

% Set initial agent poses
initPose = [60.68 624.4 350.6 579.2 782.5 430.3;
            301.0 43.43 161.5 299.7 408.0 482.4;
            2.394 0.414 1.810 5.715 1.341 2.84]';