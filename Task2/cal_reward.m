function sum_Reward = cal_reward( optim_pol, rewrd )
%walkOptimalPolicy follow the optimal policy to try
%to see what the total return is.

    init_state = 1;
    m = 0;
    sum_Reward = 0;
    while( init_state ~= 100 && m < 100)
        a = optim_pol(init_state);
        sum_Reward = sum_Reward + rewrd(init_state, a);
        init_state = transit(init_state, a);
        m = m + 1;
    end
    if init_state ~= 100 % never reached the goal
        sum_Reward = -1;
    end
end

