%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

clear;
clc;
format long;

%% Choose which case to run
run_which_case = '3';


addpath(genpath('.'));

%% Load experimental data
[tscale, botPose, botZ, botCz, botInput] = retrieve_data(strcat('exp_case_', run_which_case, '.mat'));

%% Load experimental parameters
[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botCost, v, c] = load_param(tscale, botPose, botZ, botCz);

%% Plot the results
plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, 320);
plot_with_image(strcat('exp_case_', run_which_case, '_image.jpg'), REGION_CONFIG, CONTROL_PARAM, botZ, botCz, v, c, 320);

rmpath(genpath('.'));
