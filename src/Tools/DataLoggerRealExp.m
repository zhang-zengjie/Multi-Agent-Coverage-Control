classdef DataLoggerRealExp < DataLogger
    %DATALOGGERREALEXP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function excTime = get_time_axis(obj, clip)
            t_ = obj.ExcTime(clip(1):clip(2));
            excTime = (t_' - t_(1)) / 1e3;
        end
        
        function set_time_axis(obj, timeAxis)
            obj.ExcTime = timeAxis;
        end
    end
end

