%% Configure the parameters here
% Set simulation configuration
dt = 0.05;          % Time step
EndTime = 200;
nAgent = 24;         % The number of agents
w0 = 0.8.*ones(1,nAgent);    % Desired orbital velocity (rad/s) 
v0 = 40.*ones(1,nAgent);     % Constant heading velocity (m/s)

% Region Configuration
region_width = 800;
region_height = 600;

% Controller Parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 4;       % Control gain gamma
eps = 0.2;       % Epsilon of the sigmoi function
controller = "BLF";
plot_size = 480;

% Set initial agent poses
rng(1);

initPose = [((rand(1, nAgent)-0.5)*0.8+0.5)*region_width;
            ((rand(1, nAgent)-0.5)*0.8+0.5)*region_height;
            rand([1, nAgent])*2*pi]';

