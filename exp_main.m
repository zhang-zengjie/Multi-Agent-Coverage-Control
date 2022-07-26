%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

clear;
clc;

format long;
addpath(genpath('./experiment'));
addpath(genpath('./commons'));

[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, ...
    botZ, botCz, botPose, botCost, botInput, ...
        v, c] = load_dat_and_param('exp.log.4.mat');


plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM,...
    botZ, botCz, botPose, botCost, botInput, v, c);

plot_with_image('exp4background.jpg', REGION_CONFIG, botZ, botCz, v, c);

rmpath(genpath('./experiment'));
rmpath(genpath('./commons'));

