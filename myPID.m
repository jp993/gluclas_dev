function output=myPID(ref,y,Ie_old,y_old,controller_paramters)
% Kp [dl/min]
% Ki [dl/min^2]
% Kd [dl]

%% Proportional Action
    % deleteIe_flag = controller_parameters.deleteIe_flag;
    P=controller_paramters.Kp*(ref-y);         %[mg/min]

%% Integral Action
    I=controller_paramters.Ki*Ie_old;            %[mg/min]
    % Integral of the error
        Ie=Ie_old+(ref-y)*controller_paramters.Ts; %[(mg/dl)*min]
        % Ie = Ie*deleteIe_flag;
    % AntiWind-up
        Ie=min(Ie,controller_paramters.e_max);
        Ie=max(Ie,controller_paramters.e_min);

%     I=controller_paramters.Ki*Ie;            %[mg/min]
    
%% Derivative Action
   dy=(y-y_old(1))/controller_paramters.Ts;  %[mg/dl/min]
   D= -controller_paramters.Kd*dy;            %[mg/min]
   
   
%% Total Unsaturated Control Action
    u_totUnsat= P+I+D; %[mg/min]

%% Final Control Action
    u= min(u_totUnsat,controller_paramters.controller_max);
    u= max(u_totUnsat,controller_paramters.controller_min);
    
    output=[u,Ie,P,I,D,u_totUnsat]';
