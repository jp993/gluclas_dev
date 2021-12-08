function getMeasure_control(mTimer,~)
    mainapp = mTimer.UserData.app;
    period = mTimer.UserData.period;
    window_popup_control(mainapp, period);
end