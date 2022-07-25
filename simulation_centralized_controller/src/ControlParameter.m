function CONTROL_PARAM = ControlParameter(v0, w0, Q, gamma, eps)

    CONTROL_PARAM.Q2x2 = Q;
    CONTROL_PARAM.GAMMA = gamma;
    CONTROL_PARAM.EPS_SIGMOID = eps;
    CONTROL_PARAM.V_CONST = v0;
    CONTROL_PARAM.W_ORBIT = w0;