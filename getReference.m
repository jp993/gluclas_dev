function y = getReference(delta_t,mainapp)
   
    % ------- hypoglycemic ------- %
    Y1_hypo = 3.885;     % 70 mg/dl
    Y2_hypo = 2.775;     % 50 mg/dl
    Y3_hypo = 2.5;       % 45 mg/dl
    T1_hypo = 25;        
    T2_hypo = 55;
    T3_hypo = 70;
    % ---------------------------- %
    % ----------- else ----------- %
    Y_plateau = mainapp.protocol.refPlateau;
    % ---------------------------- %

    % ------- ending phase ------- %
    Y_end = 4.5;          % 81 mg/dl
    % ---------------------------- %
    
    switch mainapp.ExperimentStatus
        case 'control2ref'
            switch mainapp.protocol.getClampType
                case 'Hypoglycemic'
                    if delta_t<T1_hypo
                        y = Y1_hypo;
                    elseif delta_t<T2_hypo
                        delta_t1 = T1_hypo;
                        delta_t2 = T2_hypo;
                        y1 = Y1_hypo;
                        y2 = Y2_hypo;
                        y = (y2-y1)*(delta_t-delta_t1)/(delta_t2-delta_t1)+y1;       
                    elseif delta_t<T3_hypo
                        delta_t1 = T2_hypo;
                        delta_t2 = T3_hypo;
                        y1 = Y2_hypo;
                        y2 = Y3_hypo;
                        y = (y2-y1)*(delta_t-delta_t1)/(delta_t2-delta_t1)+y1;                 
                    else
                        y = Y3_hypo;
                    end
                otherwise
                    y = Y_plateau;
            end
        case 'control2eu'
            y = Y_end;
    end
    
end