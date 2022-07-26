clear;
clc;
format long;

EndTime = 40;

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

controller = "BLF";

addpath(genpath('./simulation'));
addpath(genpath('./commons'));

% Go to './src/set_sim_parameter.m' to change more simulation functions
[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM] = set_sim_parameter(Q, gamma, eps, initPose, controller, EndTime);
[botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM);

plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM,...
    botZ, botCz, botPose, botCost, botInput, v, c);

rmpath(genpath('./simulation'));
rmpath(genpath('./commons'));