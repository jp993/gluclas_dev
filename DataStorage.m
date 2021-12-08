classdef DataStorage < handle  
    properties 
        BG_value
        BG_time
        suggGIR_value
        realGIR_value
        GIR_time
        last_y_time
        last_y_value
        Ie
    end
    
    methods 
        function obj = DataStorage(bg,t_bg,gir1,gir2,t_gir,lyt,lyv,ie)
            if nargin>0
                obj.BG_value = bg;
                obj.BG_time = t_bg;
                obj.suggGIR_value = gir1;
                obj.realGIR_value = gir2;
                obj.GIR_time = t_gir;
                obj.last_y_time = lyt;
                obj.last_y_value = lyv;
                obj.Ie = ie;
            else
                obj.BG_value = [];
                obj.BG_time = [];
                obj.suggGIR_value = [];
                obj.realGIR_value = [];
                obj.GIR_time = [];
                obj.last_y_time = [];
                obj.last_y_value = [];
                obj.Ie = 0;
            end
        end
        
        function [y,t] = getBG(obj) 
            y = obj.BG_value;
            t = obj.BG_time;
        end
        
        function [y1,y2,t] = getGIR(obj) 
            y1 = obj.suggGIR_value;
            y2 = obj.realGIR_value;
            t = obj.GIR_time;
        end        
        
        function [y,t] = getLastPoint(obj)
            y = obj.last_y_value;
            t = obj.last_y_time; 
        end
    end
end
