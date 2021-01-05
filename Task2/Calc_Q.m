% Calc_Q function calculates the Q value according to the iterative update
% rule formula
function [Q_val, No, goal_reached] = Calc_Q(reward, Q_val, No, discount, a_decay_meth, e_decay_meth)    
iterations = 300; % some big number, almost like a while loop
state = ones(iterations,1);     % state 1 - 100
action = ones(iterations,1);    % action 1 - 4
goal_reached = false;

for k=1:iterations
    alp = calc_decay(k, a_decay_meth);              % alp is the learning rate alpha_k
    epsil = calc_decay(k, e_decay_meth);            % epsil is the exploration probabiility epsilon_k
    action(k) = explore_or_exploit(Q_val, reward, state(k), epsil);     % action to take at step k
    state(k+1) = transit(state(k), action(k));                          % update to new state as per state transition defined by action at step k
    No(state(k),action(k)) = No(state(k),action(k)) + 1;                % counts no. of times action is visited.
    % iterative update formula for Q-learning
    Q_val(state(k),action(k)) = Q_val(state(k),action(k)) + alp*(reward(state(k),action(k)) + discount*max(Q_val(state(k+1),:)) - Q_val(state(k),action(k)));
    if state(k+1) == 100                            % check if stop state is reached
        goal_reached = true;
        break
    elseif alp < 0.005                              % exit also if learning rate is too small which will update Q values very little
        break
    end
end
end