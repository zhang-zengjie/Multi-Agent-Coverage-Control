%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

clear;
clc;

format long;
addpath(genpath('./experiment'));
addpath(genpath('./commons'));


[tscale, botPose, botZ, botCz, botInput] = retrieve_data('exp_case_1.mat');

[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botCost, v, c] = load_param(max(size(tscale)), botPose, botZ, botCz);


plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, tscale);

plot_with_image('exp_case_1_image.jpg', REGION_CONFIG, CONTROL_PARAM, botZ, botCz, v, c);

rmpath(genpath('./experiment'));
rmpath(genpath('./commons'));

