%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zengjie Zhang, Nhan Khanh Le
% July 25, 2022

addpath(genpath('.'));

SIM_PARAM = SimulationParameter(nAgent, dt, dt:dt:EndTime, initPose);
[vertexes, A, b] = gen_rect(region_width, region_height);
REGION_CONFIG = RegionParameter(vertexes, [A b]);
CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps, controller);

[botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM);

plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, plot_size);

rmpath(genpath('.'));