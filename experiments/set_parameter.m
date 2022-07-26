%% Simulation Parameters
dt = 0.01;          % Time step
maxIter = max(size(dataTable.Agent_20001.Time));    % Maximum iteration
T = maxIter*dt;     % Ending time
nAgent = 6;         % The number of agents
w0 = 0.8.*ones(1,nAgent);       % Desired orbital velocity (rad/s) 
v0 = 0.16.*ones(1,nAgent);        % Constant heading velocity (m/s)

%% Region Configuration
Width = 4000;
Height = 2800;
A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
b = [0, Width, Height, 0]';
vertexes = [0, 0; 0, Height; Width, Height; Width, 0; 0, 0];

%% Controller parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 1;       % Control gain gamma
eps = 2;       % Epsilon of the sigmoi function