%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

clear;
clc;
addpath(genpath('.'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Select a parameter setting command for the corresponding simuation study

set_sim_compare_conv_param;

%     | command name                     | case number | case name           | configuration |
%     | -------------------------------- | -- | ---------------------------- | ------------- |
%     | `set_sim_case_1_param`           | #1 | different initial conditions | #1            |
%     | `set_sim_case_2_param`           | #1 | different initial conditions | #2            |
%     | `set_sim_case_3_param`           | #1 | different initial conditions | #3            |
%     | `set_sim_eps_10_param`           | #2 | different parameters         | $\varepsilon$ |
%     | `set_sim_gamma_10_param`         | #2 | different parameters         | $\gamma$      |
%     | `set_sim_Q_10_param`             | #2 | different parameters         | $Q$           |
%     | `set_sim_large_param`            | #3 | large number of robots       | $100$ agents  |
%     | `set_sim_compare_proposed_param` | #4 | comparison study             | proposed      |
%     | `set_sim_compare_conv_param`     | #4 | comparison study             | conventional  |

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SIM_PARAM = SimulationParameter(nAgent, dt, dt:dt:EndTime, initPose);
[vertexes, A, b] = gen_rect(region_width, region_height);
REGION_CONFIG = RegionParameter(vertexes, [A b]);
CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps, controller);

[botZ, botCz, botPose, botCost, botInput, v, c] = run_sim(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM);

plot_results(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, botPose, botCost, botInput, v, c, plot_size);

rmpath(genpath('.'));