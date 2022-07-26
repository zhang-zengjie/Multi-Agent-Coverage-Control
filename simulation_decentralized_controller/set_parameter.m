%% Simulation Parameters

T = 40;           % Ending time
dt = 0.01;          % Time step
maxIter = T/dt;     % Maximum iteration
nAgent = 6;         % The number of agents
w0 = 0.8.*ones(1,nAgent);    % Desired orbital velocity (rad/s) 
v0 = 40.*ones(1,nAgent);     % Constant heading velocity (m/s)

%% Region Configuration
Width = 800;
Height = 600;
A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
b = [0, Width, Height, 0]';
vertexes = [0, 0; 0, Height; Width, Height; Width, 0; 0, 0];
        

%% Controller Parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 0.1;       % Control gain gamma
eps = 2;       % Epsilon of the sigmoi function


%% Set initial agent poses
initPose = [60.68 624.4 350.6 579.2 782.5 430.3;
            301.0 43.43 161.5 299.7 408.0 482.4;
            2.394 0.414 1.810 5.715 1.341 2.84]'; % Case 1
%
% initPose = [177.1 696.9 165.7 734.8 390.3 489.3;
%             459.7 311.5 177.7 113.1 48.70 443.5;
%             2.773 0.995 5.529 1.722 2.603 1.860]'; % Case 2
% 
% initPose = [349.1 20.24 439.9 348.4 336.6 263.8;
%             123.2 371.5 180.3 159.6 372.3 317.5;
%             0.845 3.227 1.159 4.934 5.366 3.105]'; % Case 3
    
    