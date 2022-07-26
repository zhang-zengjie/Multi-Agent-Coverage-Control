function [SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c] = load_dat_and_param(file_name)

    load(file_name, 'dataTable');

    maxIter = max(size(dataTable.Agent_20001.Time));    % Maximum iteration

    nAgent = 6; 

    botPose = zeros(nAgent, 3, maxIter);
    botZ = zeros(nAgent, 2, maxIter);
    botCz = zeros(nAgent, 2, maxIter);
    botCost = zeros(1, maxIter);
    botInput = zeros(nAgent, maxIter);
    
    botPose(1, 1, :) = dataTable.Agent_20001.x(1:maxIter);
    botPose(1, 2, :) = dataTable.Agent_20001.y(1:maxIter);
    botPose(2, 1, :) = dataTable.Agent_20002.x(1:maxIter);
    botPose(2, 2, :) = dataTable.Agent_20002.y(1:maxIter);
    botPose(3, 1, :) = dataTable.Agent_20003.x(1:maxIter);
    botPose(3, 2, :) = dataTable.Agent_20003.y(1:maxIter);
    botPose(4, 1, :) = dataTable.Agent_20004.x(1:maxIter);
    botPose(4, 2, :) = dataTable.Agent_20004.y(1:maxIter);
    botPose(5, 1, :) = dataTable.Agent_20005.x(1:maxIter);
    botPose(5, 2, :) = dataTable.Agent_20005.y(1:maxIter);
    botPose(6, 1, :) = dataTable.Agent_20006.x(1:maxIter);
    botPose(6, 2, :) = dataTable.Agent_20006.y(1:maxIter);
    
    botZ(1, 1, :) = dataTable.Agent_20001.zx(1:maxIter);
    botZ(1, 2, :) = dataTable.Agent_20001.zy(1:maxIter);
    botZ(2, 1, :) = dataTable.Agent_20002.zx(1:maxIter);
    botZ(2, 2, :) = dataTable.Agent_20002.zy(1:maxIter);
    botZ(3, 1, :) = dataTable.Agent_20003.zx(1:maxIter);
    botZ(3, 2, :) = dataTable.Agent_20003.zy(1:maxIter);
    botZ(4, 1, :) = dataTable.Agent_20004.zx(1:maxIter);
    botZ(4, 2, :) = dataTable.Agent_20004.zy(1:maxIter);
    botZ(5, 1, :) = dataTable.Agent_20005.zx(1:maxIter);
    botZ(5, 2, :) = dataTable.Agent_20005.zy(1:maxIter);
    botZ(6, 1, :) = dataTable.Agent_20006.zx(1:maxIter);
    botZ(6, 2, :) = dataTable.Agent_20006.zy(1:maxIter);
    
    botCz(1, 1, :) = dataTable.Agent_20001.Cx(1:maxIter);
    botCz(1, 2, :) = dataTable.Agent_20001.Cy(1:maxIter);
    botCz(2, 1, :) = dataTable.Agent_20002.Cx(1:maxIter);
    botCz(2, 2, :) = dataTable.Agent_20002.Cy(1:maxIter);
    botCz(3, 1, :) = dataTable.Agent_20003.Cx(1:maxIter);
    botCz(3, 2, :) = dataTable.Agent_20003.Cy(1:maxIter);
    botCz(4, 1, :) = dataTable.Agent_20004.Cx(1:maxIter);
    botCz(4, 2, :) = dataTable.Agent_20004.Cy(1:maxIter);
    botCz(5, 1, :) = dataTable.Agent_20005.Cx(1:maxIter);
    botCz(5, 2, :) = dataTable.Agent_20005.Cy(1:maxIter);
    botCz(6, 1, :) = dataTable.Agent_20006.Cx(1:maxIter);
    botCz(6, 2, :) = dataTable.Agent_20006.Cy(1:maxIter);
    
    botInput(1, :) = dataTable.Agent_20001.w(1:maxIter);
    botInput(2, :) = dataTable.Agent_20002.w(1:maxIter);
    botInput(3, :) = dataTable.Agent_20003.w(1:maxIter);
    botInput(4, :) = dataTable.Agent_20004.w(1:maxIter);
    botInput(5, :) = dataTable.Agent_20005.w(1:maxIter);
    botInput(6, :) = dataTable.Agent_20006.w(1:maxIter);
    
    %% Simulation Parameters
    dt = 0.01;          % Time step
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