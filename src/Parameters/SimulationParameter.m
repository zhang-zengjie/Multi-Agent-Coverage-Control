classdef SimulationParameter < handle
    properties
        MAX_ITER = 50000;
        N_AGENT = 6;
        TIME_STEP
        TIME_SCALE
        ID_LIST 
        START_POSE
    end
   
    methods 
       function obj = SimulationParameter(nAgent, dt, t_scale, initialPose)
           % Assigned specific IDs for each agents to clarify the coommunication protocol 
           
           obj.TIME_SCALE = t_scale;
           obj.TIME_STEP = dt;
           obj.MAX_ITER = max(size(t_scale));
           obj.N_AGENT = nAgent;
           obj.ID_LIST = (1:obj.N_AGENT);
           obj.START_POSE = initialPose(1:obj.N_AGENT,:);
       end       
    end
end


