function t = popupTimer_control(mainapp, period)

secondsBreakInterval = period;

t = timer;
t.UserData.app = mainapp;
t.UserData.period = period;
t.TimerFcn = @getMeasure_control;
t.StopFcn = @popupTimerCleanup;
t.Period = secondsBreakInterval;
t.ExecutionMode = 'fixedSpacing';
end 