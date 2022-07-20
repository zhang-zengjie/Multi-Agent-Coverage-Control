%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Zengjie Zhang
% Date: July 20, 2022

% Run main.m to perform the simulation.
% Run plot_results to plot the data.

clear;
clc;
format long;
addpath('./commons');

% Control Parameters
parameters.Q = eye(1);
parameters.gamma = 5;

% Simulation Paramters
nAgent = 6;
epsSigmoid = 0.2;
v0 = 50;
w0 = 1;
seed = 7;
sample_time = 0.01;
simTime = 40;
maxIter = simTime/sample_time;
rng(seed);

% Region Configuration
regionMaxX = 800;
regionMaxY = 600;
A = [-1 , 0; 1 , 0; 0 , 1; 0 , -1];
b = [0, regionMaxX, regionMaxY, 0]';


% Initial Condition
startX = rand([1, nAgent])*regionMaxX;
startY = rand([1, nAgent])*regionMaxY;
startTheta = rand([1, nAgent])*2*pi;


simConfig.dt = sample_time;
simConfig.bndCoeff = [A b];
simConfig.bndVertexes = [0, 0; 0,regionMaxY; regionMaxX,regionMaxY; regionMaxX, 0; 0, 0];
simConfig.agentInitPose = [startX', startY', startTheta'];
simConfig.agentVConst = v0.*ones(1,nAgent);
simConfig.agentWOrbit = w0.*ones(1,nAgent);
simConfig.epsSigmoid = epsSigmoid;


simulator = centralized_controller(nAgent, simConfig, parameters);

botPose = zeros(nAgent, 3, maxIter);
botZ = zeros(nAgent, 2, maxIter);
botCz = zeros(nAgent, 2, maxIter);
botCost = zeros(1, maxIter);
botInput = zeros(nAgent, maxIter);

for itn = 1: maxIter
    [Info, BLF, outputs, v, c] = simulator.loop();
    botPose(:, :, itn) = outputs.CurPose;
    botZ(:, :, itn) = outputs.CurPoseVM;
    botCz(:, :, itn) = outputs.CurPoseCVT;
    botInput(:, itn) = outputs.CurAngularVel;
    botCost(itn) = BLF;
    
    if(mod(itn, 1) == 0)
        fprintf('Simulation Time: %d Lyp: %f \n',itn*sample_time, BLF);
    end

end


