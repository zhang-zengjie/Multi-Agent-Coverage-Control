function [SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, t_scale] = set_sim_parameter(Q, gamma, eps, initPose, type, T)

%% Simulation Parameters

    dt = 0.05;          % Time step
    nAgent = 6;         % The number of agents
    w0 = 0.8.*ones(1,nAgent);    % Desired orbital velocity (rad/s) 
    v0 = 0.160.*ones(1,nAgent);     % Constant heading velocity (m/s)
    
    t_scale = dt:dt:T;

    %% Region Configuration
    Width = 4;
    Height = 2.8;
    A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
    b = [0, Width, Height, 0]';
    vertexes = [0, 0; 0, Height; Width, Height; Width, 0; 0, 0];
            

    SIM_PARAM = SimulationParameter(dt, T/dt, nAgent, initPose);
    REGION_CONFIG = RegionParameter(vertexes, [A, b]);
    CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps, type);

    
