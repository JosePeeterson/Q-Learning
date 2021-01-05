function optim_pol = cal_Optim_Pol(Q_val)
% Calculates the optimum policy for the given value of Q
    [~, optim_pol] = max(Q_val, [], 2);
end
