function state_k1 = transit(state_k, action_k)
% Transition from one state s_k to another s_k1, based on action a_k
% Assumed - actions 1, 2, 3, 4 correspond to up, right, down, left.

    
    grid = [10 10];
    
    action_dir = [
        -1, 0; % up
        0, 1; % right
        1, 0; % down
        0,-1;]; % left
    [s_k_i, s_k_j] = ind2sub(grid,state_k); % current state i,j
    state_k1_sub = [s_k_i, s_k_j] + action_dir(action_k,:); % next state i,j
    state_k1 = sub2ind(grid, state_k1_sub(1), state_k1_sub(2)); % next state
end