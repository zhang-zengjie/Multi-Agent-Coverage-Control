classdef ControlParameter < handle
     properties
        V_CONST = 40;
        W_ORBIT = 0.8;
        Q2x2 = 5 * eye(2);
        GAMMA = 3;
        EPS_SIGMOID = 5
        W_LIMIT = 1.6;
     end
    
    methods
        function obj = ControlParameter(vConst, wOrbit, Q, gamma, eps)
            obj.V_CONST = vConst;
            obj.W_ORBIT = wOrbit;
            obj.W_LIMIT = 2.0;
            obj.Q2x2 = Q;
            obj.GAMMA = gamma;
            obj.EPS_SIGMOID = eps;
        end
    end
     
end

