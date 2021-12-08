classdef Protocol < handle  
    properties 
        insBasal
        insBolus
        insConcentration
        dexConcentration
        clampType
        refPlateau
    end
    
    methods 
        function obj = Protocol(clampType, refPlateau, ibasal, ibolus, ...
                iconc, dconc)
            obj.clampType = clampType;
            obj.refPlateau = refPlateau;
            if nargin>2
                obj.insBasal = ibasal;
                obj.insBolus = ibolus;
                obj.insConcentration = iconc;
                obj.dexConcentration = dconc;
            else 
                obj.insBasal = [];
                obj.insBolus = [];
                obj.insConcentration = [];
                obj.dexConcentration = [];
            end
        end
        
        function y = getClampType(obj)
            y = obj.clampType;
        end
        
        function y = getInsBolus(obj,BW)
            ibolus = obj.insBolus;
            iconc = obj.insConcentration;
            y =  (ibolus/iconc)*BW;
        end
        
        function y = getInsInfusionRate(obj,BSA)
            ibasal = obj.insBasal;
            iconc = obj.insConcentration;
            y = (ibasal/iconc)*BSA*60/1000;
        end       
       
    end
end