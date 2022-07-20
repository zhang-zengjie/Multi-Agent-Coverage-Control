%% agent_dynamics - distributed controller for unicycle agent
%

classdef agent_dynamics < handle
    %AGENT_CONTROLLER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % Public
        ID              % int
        curPose         % [x y theta]
        curVMPose       % [x y]
        curCVTPose      % [x y]
        regionCoeff     % [a1 a2 b] --> a1*x + a2*y - b <= 0
        
        % Private
        dt              % Simulation time step
        vConst          % const float
        wOrbit          % const float
        w               % float: current angular velocity
        v               % float: current heading velocity
        lastSubV
        currentSubV
    end
    
    properties (Access = private)
        
    end
    
    methods
        % Initalize class handler
        function obj = agent_dynamics(dt)
            obj.dt = dt;
            obj.v = 0;
            obj.w = 0;
        end
        
        % One time configuration
        %   Assign a fix ID for each controller for communication broadcasting and easy debugging
        %   Assign the coefficient of the closed convex region: [coverageRegionCoeff] = [a1 a2 b] --> a1*x + a2*y - b <= 0
        function obj = begin(obj, botID, coverageRegionCoeff, initPose, v0, w0)
            obj.ID = botID;
            obj.regionCoeff = coverageRegionCoeff;
            obj.vConst = v0;
            obj.wOrbit = w0;
            
            % Update initial position
            obj.setState(initPose);
        end
        
        %% Position feedback and internal state update
       function [newVMPose] = setState(obj, newPose)
            % Update Current state
            obj.curPose = newPose;
            % Update virtual center, save internally
            [curVM] = obj.updateVirtualCenter();
            newVMPose = curVM;
        end
        

        function [poseVM] = updateVirtualCenter(obj)            
            obj.curVMPose(1) = obj.curPose(1) - (obj.vConst/obj.wOrbit) * sin(obj.curPose(3)); 
            obj.curVMPose(2) = obj.curPose(2) + (obj.vConst/obj.wOrbit) * cos(obj.curPose(3)); 
            poseVM = [obj.curVMPose];
        end
        
        
        function setAngularVel(obj, w)
            obj.w = w;
        end
        
        function setHeadingVel(obj, v)
            obj.vConst = v;
        end
        
        
        function [newPose] = move(obj) % Unicycle Dynamic
            % Universal time step
            if(obj.dt == 0)
               error("Simulation time step dt was not assigned"); 
            end
            newPose = zeros(3,1); % [X Y Theta]
            newPose(1) = obj.curPose(1) + obj.dt * (obj.vConst * cos(obj.curPose(3)));
            newPose(2) = obj.curPose(2) + obj.dt * (obj.vConst * sin(obj.curPose(3)));
            newPose(3) = obj.curPose(3) + obj.dt * obj.w;
            obj.curPose = newPose;
        end
    end
end

