classdef ControlParameter < handle
     properties
        V_CONST;
        W_ORBIT;
        Q2x2;
        GAMMA;
        EPS_SIGMOID;
        W_LIMIT;
        CONTROLLER = "BLF";
     end
    
    methods
        function obj = ControlParameter(vConst, wOrbit, Q, gamma, eps, type)
            obj.V_CONST = vConst;
            obj.W_ORBIT = wOrbit;
            obj.W_LIMIT = 2;
            obj.Q2x2 = Q;
            obj.GAMMA = gamma;
            obj.EPS_SIGMOID = eps;
            obj.CONTROLLER = type;
        end
    end
     
end

