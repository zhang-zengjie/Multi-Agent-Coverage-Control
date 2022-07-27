function [t_scale, botPose, botZ, botCz, botInput] = retrieve_data(file_name)

    load(file_name, 'dataTable', 'effective_clip');

    nAgent = 6; 

    t_scale = (dataTable.Agent_20001.Time(effective_clip.begin:end-effective_clip.end) - dataTable.Agent_20001.Time(effective_clip.begin))'/1000;
    maxIter = max(size(t_scale));

    botPose = zeros(nAgent, 3, maxIter);
    botZ = zeros(nAgent, 2, maxIter);
    botCz = zeros(nAgent, 2, maxIter);
    botInput = zeros(nAgent, maxIter);

    botPose(1, 1, :) = dataTable.Agent_20001.x(1:maxIter)/1000;
    botPose(1, 2, :) = dataTable.Agent_20001.y(1:maxIter)/1000;
    botPose(1, 3, :) = dataTable.Agent_20001.theta(1:maxIter);
    botPose(2, 1, :) = dataTable.Agent_20002.x(1:maxIter)/1000;
    botPose(2, 2, :) = dataTable.Agent_20002.y(1:maxIter)/1000;
    botPose(2, 3, :) = dataTable.Agent_20002.theta(1:maxIter);
    botPose(3, 1, :) = dataTable.Agent_20003.x(1:maxIter)/1000;
    botPose(3, 2, :) = dataTable.Agent_20003.y(1:maxIter)/1000;
    botPose(3, 3, :) = dataTable.Agent_20003.theta(1:maxIter);
    botPose(4, 1, :) = dataTable.Agent_20004.x(1:maxIter)/1000;
    botPose(4, 2, :) = dataTable.Agent_20004.y(1:maxIter)/1000;
    botPose(4, 3, :) = dataTable.Agent_20004.theta(1:maxIter);
    botPose(5, 1, :) = dataTable.Agent_20005.x(1:maxIter)/1000;
    botPose(5, 2, :) = dataTable.Agent_20005.y(1:maxIter)/1000;
    botPose(5, 3, :) = dataTable.Agent_20005.theta(1:maxIter);
    botPose(6, 1, :) = dataTable.Agent_20006.x(1:maxIter)/1000;
    botPose(6, 2, :) = dataTable.Agent_20006.y(1:maxIter)/1000;
    botPose(6, 3, :) = dataTable.Agent_20006.theta(1:maxIter);
    
    botZ(1, 1, :) = dataTable.Agent_20001.zx(1:maxIter)/1000;
    botZ(1, 2, :) = dataTable.Agent_20001.zy(1:maxIter)/1000;
    botZ(2, 1, :) = dataTable.Agent_20002.zx(1:maxIter)/1000;
    botZ(2, 2, :) = dataTable.Agent_20002.zy(1:maxIter)/1000;
    botZ(3, 1, :) = dataTable.Agent_20003.zx(1:maxIter)/1000;
    botZ(3, 2, :) = dataTable.Agent_20003.zy(1:maxIter)/1000;
    botZ(4, 1, :) = dataTable.Agent_20004.zx(1:maxIter)/1000;
    botZ(4, 2, :) = dataTable.Agent_20004.zy(1:maxIter)/1000;
    botZ(5, 1, :) = dataTable.Agent_20005.zx(1:maxIter)/1000;
    botZ(5, 2, :) = dataTable.Agent_20005.zy(1:maxIter)/1000;
    botZ(6, 1, :) = dataTable.Agent_20006.zx(1:maxIter)/1000;
    botZ(6, 2, :) = dataTable.Agent_20006.zy(1:maxIter)/1000;
    
    botCz(1, 1, :) = dataTable.Agent_20001.Cx(1:maxIter)/1000;
    botCz(1, 2, :) = dataTable.Agent_20001.Cy(1:maxIter)/1000;
    botCz(2, 1, :) = dataTable.Agent_20002.Cx(1:maxIter)/1000;
    botCz(2, 2, :) = dataTable.Agent_20002.Cy(1:maxIter)/1000;
    botCz(3, 1, :) = dataTable.Agent_20003.Cx(1:maxIter)/1000;
    botCz(3, 2, :) = dataTable.Agent_20003.Cy(1:maxIter)/1000;
    botCz(4, 1, :) = dataTable.Agent_20004.Cx(1:maxIter)/1000;
    botCz(4, 2, :) = dataTable.Agent_20004.Cy(1:maxIter)/1000;
    botCz(5, 1, :) = dataTable.Agent_20005.Cx(1:maxIter)/1000;
    botCz(5, 2, :) = dataTable.Agent_20005.Cy(1:maxIter)/1000;
    botCz(6, 1, :) = dataTable.Agent_20006.Cx(1:maxIter)/1000;
    botCz(6, 2, :) = dataTable.Agent_20006.Cy(1:maxIter)/1000;
    
    botInput(1, :) = dataTable.Agent_20001.w(1:maxIter);
    botInput(2, :) = dataTable.Agent_20002.w(1:maxIter);
    botInput(3, :) = dataTable.Agent_20003.w(1:maxIter);
    botInput(4, :) = dataTable.Agent_20004.w(1:maxIter);
    botInput(5, :) = dataTable.Agent_20005.w(1:maxIter);
    botInput(6, :) = dataTable.Agent_20006.w(1:maxIter);