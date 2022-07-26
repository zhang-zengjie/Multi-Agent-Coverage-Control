function SIM_PARAM = SimulationParameter(dt, maxIter, nAgent, initPose)

    SIM_PARAM.TIME_STEP = dt;
    SIM_PARAM.MAX_ITER = maxIter;
    SIM_PARAM.SIM_TIME = dt*maxIter;
    SIM_PARAM.N_AGENT = nAgent;
    SIM_PARAM.START_POSE = initPose;
