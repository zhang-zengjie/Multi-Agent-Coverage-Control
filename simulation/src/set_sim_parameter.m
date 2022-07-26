function [SIM_PARAM, REGION_CONFIG, CONTROL_PARAM] = set_sim_parameter(Q, gamma, eps, initPose, type, T)

%% Simulation Parameters

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
            

    SIM_PARAM = SimulationParameter(dt, maxIter, nAgent, initPose);
    REGION_CONFIG = RegionParameter(vertexes, [A, b]);
    CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps, type);

    
