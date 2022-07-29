%% Configure the parameters here
% Set simulation configuration
dt = 0.05;          % Time step
EndTime = 150;
nAgent = 6;         % The number of agents
w0 = 0.8.*ones(1,nAgent);    % Desired orbital velocity (rad/s) 
v0 = 0.16.*ones(1,nAgent);     % Constant heading velocity (m/s)

% Region Configuration
region_width = 4;
region_height = 2.8;

% Controller Parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 1;       % Control gain gamma
eps = 10;       % Epsilon of the sigmoi function
controller = "BLF";
plot_size = 320;

% Set initial agent poses
addpath('src/Tools', 'src/Parameters', 'data/experiment');
[~, botPose, ~, ~, ~] = retrieve_data('exp_case_2.mat');
rmpath('src/Tools', 'src/Parameters', 'data/experiment');
initPose = botPose(:,:,1);