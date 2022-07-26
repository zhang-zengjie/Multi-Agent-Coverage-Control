%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nhan Khanh Le, Zengjie Zhang
% July 25, 2022

clear;
clc;
format long;
addpath(genpath('./src'));
addpath(genpath('../commons'));

set_parameter;


SIM_PARAM = SimulationParameter(dt, maxIter, nAgent, initPose);
REGION_CONFIG = RegionParameter(vertexes, [A, b]);
CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps);

simulation = centralized_controller(SIM_PARAM, REGION_CONFIG, CONTROL_PARAM);

botPose = zeros(nAgent, 3, maxIter);
botZ = zeros(nAgent, 2, maxIter);
botCz = zeros(nAgent, 2, maxIter);
botCost = zeros(1, maxIter);
botInput = zeros(nAgent, maxIter);

for itn = 1: maxIter
    [Info, BLF, outputs, v, c] = simulation.loop();
    botPose(:, :, itn) = outputs.CurPose;
    botZ(:, :, itn) = outputs.CurPoseVM;
    botCz(:, :, itn) = outputs.CurPoseCVT;
    botInput(:, itn) = outputs.CurAngularVel;
    botCost(itn) = BLF;
    
    fprintf('Simulation Time: %d Lyp: %f \n',itn*dt, BLF);

end

plot_results;
rmpath(genpath('./src'));
rmpath(genpath('../commons'));
