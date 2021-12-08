classdef MeasUnit < handle  
    properties 
        BG
        GIR
        basal_insulin
    end
    
    methods 
        function obj = MeasUnit(bg)
            if nargin>0
                obj.BG = bg;
                obj.GIR = 'ml/h';
                obj.basal_insulin = 'ml/h';
            else
                obj.BG = 'mmol/l';                   % mg/dl
                obj.GIR = 'ml/h';                    % g/5min   
                obj.basal_insulin = 'ml/h';          % mU/min
            end
        end
    end
end