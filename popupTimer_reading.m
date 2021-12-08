function t = popupTimer_reading(mainapp, period)

secondsBreakInterval = period;

t = timer;
t.UserData.app = mainapp;
t.UserData.period = period;
t.TimerFcn = @getMeasure_reading;
t.StopFcn = @popupTimerCleanup;
t.Period = secondsBreakInterval;
t.ExecutionMode = 'fixedSpacing';

end 