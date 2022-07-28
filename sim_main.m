clear;
clc;
format long;

addpath(genpath('.'));

%% Choose the parameters to set

% set_sim_case_1_param;
% set_sim_case_2_param;
% set_sim_case_3_param;
set_sim_large_param;
% set_sim_compare_conv_param;
% set_sim_compare_proposed_param;
% set_sim_Q_10_param;
% set_sim_gamma_10_param;
% set_sim_eps_10_param;

%% Run the simulation

SIM_PARAM = SimulationParameter(nAgent, dt, dt:dt:EndTime, initPose);
[vertexes, A, b] = gen_rect(region_width, region_height);
REGION_CONFIG = RegionParameter(vertexes, [A b]);
CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps, controller);

[botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM);


plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, plot_size);

rmpath(genpath('.'));