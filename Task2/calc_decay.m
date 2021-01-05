function alp_epsil = calc_decay(k, type)
%DECAY
% Gets the value of alpha / epsilon based on the number of transitions
% k: Transitions
% type: function type - in the range of 0 to 4
    if type == 0
        alp_epsil = 1;
    elseif type == 1
        alp_epsil = 1 / k;
    elseif type == 2
        alp_epsil = 100 / (100 + k);
    elseif type == 3
        alp_epsil = (1 + log(k)) / k;
    elseif type == 4
        alp_epsil = (1 + 5*log(k)) / k;
    end
    if alp_epsil > 1
        alp_epsil = 1;
    end
end
