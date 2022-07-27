clear;
clc;
format long;

%% Set simulation configuration
EndTime = 120;

% Controller Parameters
Q = eye(2);      % Positive definite matrix Q
gamma = 1;       % Control gain gamma
eps = 2;       % Epsilon of the sigmoi function
controller = "BLF";

% Set initial agent poses


addpath(genpath('./simulation'));
addpath(genpath('./commons'));

[~, botPose, ~, ~, ~] = retrieve_data('./experiment/data/exp_case_1.mat');
initPose = botPose(:,:,1);



%% Run the simulation



% Go to './src/set_sim_parameter.m' to change more simulation functions
[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, t_scale] = set_sim_parameter(Q, gamma, eps, initPose, controller, EndTime);
[botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, max(size(t_scale)));
plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, t_scale);


rmpath(genpath('./simulation'));
rmpath(genpath('./commons'));