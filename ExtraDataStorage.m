classdef ExtraDataStorage < handle  
    properties 
        oralGlucose
        insulin
        extra_BG
    end
    
    methods 
        function obj = ExtraDataStorage()

            oralGlucose.time = [];
            oralGlucose.value = [];
            obj.oralGlucose = oralGlucose;

            insulin.bolus.time = [];
            insulin.bolus.value = [];
            insulin.infusionRateChange.time = [];
            insulin.infusionRateChange.value = [];
            obj.insulin = insulin;
            
            extra_BG.time = [];
            extra_BG.value = [];
            obj.extra_BG = extra_BG;
        end
       
    end
end