function labelfun(mTimer,~)
    app = mTimer.UserData.mainapp;
    countdown = mTimer.UserData.countdown;
    app.Label.Visible = 'on';
    app.Label.Text = sprintf('Window will close in %i seconds',countdown);
    app.Label.FontColor = [1 0 0];
end