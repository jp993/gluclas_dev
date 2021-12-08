function getMeasure_reading(mTimer,~)
    mainapp = mTimer.UserData.app;
    period = mTimer.UserData.period;
    window_popup_reading(mainapp, period);
end