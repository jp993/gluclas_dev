function t = timeFromStart(t_now,t_calibration)

    diff = t_now - t_calibration.datetime;
    t = minutes(diff);
    t = round(t);
    t = t + t_calibration.exptime;
    
end