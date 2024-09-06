%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

addpath(genpath('.'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose which case to run, 1, 2, or 3
case_num_in_str = '1';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[tscale, botPose, botZ, botCz, botInput] = retrieve_data(strcat('exp_case_', case_num_in_str, '.mat'));     % Load experimental data
[SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botCost, v, c] = load_param(tscale, botPose, botZ, botCz);        % Load experimental parameters

% Plot the results
plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, 320);
plot_with_image(strcat('exp_case_', case_num_in_str, '_image.jpg'), REGION_CONFIG, CONTROL_PARAM, botZ, botCz, v, c, 320);

rmpath(genpath('.'));
