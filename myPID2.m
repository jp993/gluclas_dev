function output=myPID2(ref,y,Ie_old,y_old,time_y,time_y_old,controller_paramters)
%% Input measurment units
% y,r and y_old are expected in [mg/dl]
% Ie is expected  [(mg/dl)*min]
% time_y,time_y_old are expected in [min]

% controller_paramters.Kp [dl/min]
% controller_paramters.Ki [dl/min^2]
% controller_paramters.Kd [dl]

%% Output measurment units
%u and u_totUnsat are in [mg/min]
%P,I,D are in [mg/min]
%Ie is in are [(mg/dl)*min]

%% Parameters
maxTimeBetweenSamplesforDerivative=15; %[min]
minTimeBetweenSamplesforDerivative=2;%[min]

minTimeBetweenSamplesforIntegralCorrection=9.5;
maxTimeBetweenSamplesforIntegral=20;


%% Input Check
% CGM values
if y<=20 && (time_y~=0)
   error('myPID_v4:LowBG','Glucose value unrealistically low')
end

if y>=300 
   warning('myPID_v4:HighBG','Glucose value unrealistically high')
end

% Time
if (time_y-time_y_old(1))<0
   disp(time_y)
   disp(time_y_old)
   error('myPID_v4:UnsortedTimeSamples','Something wrong with the samples time! The new samples has timestamp less recent with respect to the previous sample!')
end


%% Proportional Action
    P=controller_paramters.Kp*(ref-y);         %[mg/min]

%% Integral Action
    %% Correction in case of missed samples
    if  (time_y-time_y_old(1))>=maxTimeBetweenSamplesforIntegral
        warning('myPID_v4:TooMuchTimeWithoutSample','Too much time since the last sample, resetting integral action')
        Ie_old=0;
    end
    if (time_y-time_y_old(1))>minTimeBetweenSamplesforIntegralCorrection && (time_y-time_y_old(1))<maxTimeBetweenSamplesforIntegral
        warning('myPID_v4:LongTimeBetweenSamples','Long time since the last sample: adjusting integral action')
        Ie_old=Ie_old+0.5*(y-y_old)*(time_y-time_y_old(1));
        
        Ie_old=min(Ie_old,controller_paramters.e_max);
        Ie_old=max(Ie_old,controller_paramters.e_min);
    end

    I=controller_paramters.Ki*Ie_old;            %[mg/min]
    % Integral of the error
        Ie=Ie_old+(ref-y)*controller_paramters.Ts; %[(mg/dl)*min]
    
    % AntiWind-up
        Ie=min(Ie,controller_paramters.e_max);
        Ie=max(Ie,controller_paramters.e_min);

%     I=controller_paramters.Ki*Ie;            %[mg/min]
    
%% Derivative Action
       %
       if(time_y-time_y_old(1))<=maxTimeBetweenSamplesforDerivative
           if (time_y-time_y_old(1))>minTimeBetweenSamplesforDerivative
                dy=(y-y_old(1))/(time_y-time_y_old(1));    %[mg/dl/min]
           else
               warning('myPID_v4:DataPointsTooCloseInTime','Timestamps very close one another')
               dy=0;
           end
           D= -controller_paramters.Kd*dy;            %[mg/min]
       else
           D=0;
       end
   
%% Total Unsaturated Control Action
    u_totUnsat= P+I+D; %[mg/min]

%% Final Control Action
    u = min(u_totUnsat,controller_paramters.controller_max);
    u = max(u_totUnsat,controller_paramters.controller_min);
    
    output=[u,Ie,P,I,D,u_totUnsat]';
