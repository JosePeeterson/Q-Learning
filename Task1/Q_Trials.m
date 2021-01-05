function [Q_val, N_count, tim, succ_rate] = Q_Trials(reward, disc, a_decay_meth, e_decay_meth, conv_threshold, plot)
tic % start timing
Q_val = zeros(100,4);            % q value for 4 different actions at a state 
N_count = zeros(100,4);          % N_count is the number of times a action is visited at a state
differ_Q = ones(3000,1);         % differ_Q is to compute if the Q values have converged 
no_goal = 0;                     % total number of goals   
for trl=1:3000                   % trial 1 to 3000
    [Q_new, N_count, goal_reached] = Calc_Q(reward, Q_val, N_count, disc, a_decay_meth, e_decay_meth);
    no_goal = no_goal + goal_reached;       
    differ_Q(trl) = mean((Q_new(:) - Q_val(:)) .^ 2);   % check difference between current and newly calculated Q value
    if trl > 1
        differ_Q(trl) = 0.05*differ_Q(trl) + 0.95*differ_Q(trl-1);
        if differ_Q(trl) < conv_threshold
            break
        end
%         if plot && mod(trl, 5) == 0
%             plot(differ_Q(1:trl)); ylabel('||Qnew - Q||'); xlabel('Trials');
%             pause(0.1);
%         end
    end
    Q_val = Q_new;
end
succ_rate = no_goal / trl;
tim = toc;
end
