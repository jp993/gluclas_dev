classdef PatientData < handle
    properties
        ID
        group
        gender
        age
        BW
        height
    end
    
    methods 
        function obj = patientData(ID, group, gender, age, bw, h)
            if nargin>0
                obj.ID = ID;
                obj.group = group;
                obj.gender = gender;
                obj.age = age;
                obj.BW = bw;
                obj.height = h;
            else
                obj.ID = [];
                obj.group = [];
                obj.gender = 'N/A';
                obj.age = [];
                obj.BW = [];
                obj.height = [];
            end
        end
        
        function [id, group, gender, age, bw, h] = getPatientInfos(obj)
            id = obj.ID;
            group = obj.group; 
            gender = obj.gender;
            age = obj.age;
            bw = obj.BW;
            h = obj.height;
        end
    end
end