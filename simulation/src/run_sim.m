function [botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022
    %% Adding path
    
    %% Type of agent
    % Agent handler
    type = CONTROL_PARAM.CONTROLLER; % Controller Type. Please choose "BLF" (safety) or "Simple" (no safety)
    for k = 1 : SIM_PARAM.N_AGENT
        if(type == "CONV")   % Simple controller
            agentHandle(k) = UnicycleSimpleCoverageAgent(SIM_PARAM.TIME_STEP, SIM_PARAM.ID_LIST(k), SIM_PARAM.START_POSE(k,:), REGION_CONFIG, CONTROL_PARAM);
        elseif(type == "BLF")    % BLF controller
            agentHandle(k) = UnicycleCoverageAgent(SIM_PARAM.TIME_STEP, SIM_PARAM.ID_LIST(k), SIM_PARAM.START_POSE(k,:), REGION_CONFIG, CONTROL_PARAM);
        else
            agentHandle(k) = UnicycleCoverageAgent(SIM_PARAM.TIME_STEP, SIM_PARAM.ID_LIST(k), SIM_PARAM.START_POSE(k,:), REGION_CONFIG, CONTROL_PARAM);
            disp('Controller type not assigned. Use default BLF Controller');
        end
    end
    
    VISUALIZE_FREQUENCY = 0;
    
    % Instance of Logger for data post processing, persistent over all files
    Logger = DataLogger(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, CONTROL_PARAM.V_CONST, CONTROL_PARAM.W_ORBIT, VISUALIZE_FREQUENCY);
    
    % Unified Voronoi Computer
    VoronoiCom = Voronoi2D_Handler(9999, REGION_CONFIG.BOUNDARIES_VERTEXES);
    
    % Unified Communication Link for data broadcasting (GBS : global broadcasting service)
    GBS = CommunicationLink(SIM_PARAM.N_AGENT, SIM_PARAM.ID_LIST); 
    
    botCost = zeros(1, SIM_PARAM.MAX_ITER);
    for itn = 1: SIM_PARAM.MAX_ITER
        [v, terminate] = simulation_loop(SIM_PARAM, agentHandle, Logger, VoronoiCom, GBS);
        botCost(itn) = v;
        fprintf("Decentralized. Iter: %d. L: %f \n", itn, v);
        if terminate
            break
        end
        if ~mod(itn, VISUALIZE_FREQUENCY)
            Logger.live_plot();
        end
    end
    
    if itn ~= SIM_PARAM.MAX_ITER
        SIM_PARAM.MAX_ITER = itn-1;
    end
    
    botCost = botCost(:, 1:SIM_PARAM.MAX_ITER);
    botZ = Logger.PoseVM(:, :, 1:SIM_PARAM.MAX_ITER);
    botCz = Logger.CVT(:, :, 1:SIM_PARAM.MAX_ITER);
    botPose = Logger.PoseAgent(:, :, 1:SIM_PARAM.MAX_ITER);
    botInput = Logger.ControlOutput(:, 1:SIM_PARAM.MAX_ITER);
    
    v = Logger.V{SIM_PARAM.MAX_ITER};
    c = Logger.C{SIM_PARAM.MAX_ITER};
    
    
    
