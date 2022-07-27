function [SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botCost, v, c] = load_param(maxIter, botPose, botZ, botCz)

    botCost = zeros(1, maxIter);
    
    %% Simulation Parameters
    nAgent = 6;
    dt = 0.05;          % Time step
    w0 = 0.8.*ones(1,nAgent);       % Desired orbital velocity (rad/s) 
    v0 = 0.16.*ones(1,nAgent);        % Constant heading velocity (m/s)
    
    %% Region Configuration
    Width = 4;
    Height = 2.8;
    A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
    b = [0, Width, Height, 0]';
    vertexes = [0, 0; 0, Height; Width, Height; Width, 0; 0, 0];
    
    %% Controller parameters
    Q = eye(2);      % Positive definite matrix Q
    gamma = 1;       % Control gain gamma
    eps = 2;       % Epsilon of the sigmoi function
    
    SIM_PARAM = SimulationParameter(dt, maxIter, nAgent, botPose(:,:,1));
    REGION_CONFIG = RegionParameter(vertexes, [A, b]);
    CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps);
    
    tol = 0;
    for k = 1:nAgent
        Vk = zeros(1, maxIter);
        for r = 1:maxIter
            sumHj = 0;
            for j = 1: max(size(b))
                hj = (b(j)- (A(j,1)*botZ(k, 1, r) + A(j,2)*botZ(k, 2, r) + tol)); 
                sumHj = sumHj + 1/hj;
            end
        Vk(r) = (botZ(k, :, r) - botCz(k, :, r)) * Q * (botZ(k, :, r) - botCz(k, :, r))' * sumHj/ 2;
        end
        botCost = botCost + Vk;
    end
    
    [v, c]= Function_VoronoiBounded(botZ(:, 1, end), botZ(:, 2, end), REGION_CONFIG.BOUNDARIES_VERTEXES);
    c = outlierVertexList(v, c, [0 REGION_CONFIG.REGION_MAX_X], [0 REGION_CONFIG.REGION_MAX_Y]);