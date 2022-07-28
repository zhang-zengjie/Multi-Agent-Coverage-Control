function [t_scale, botPose, botZ, botCz, botInput] = retrieve_data(file_name)

    load(file_name, 'Logger', 'effective_clip');
    [botPose, botZ, botCz, ~, botInput] = Logger.get_logged_data(effective_clip);
    t_scale = Logger.get_time_axis(effective_clip);

