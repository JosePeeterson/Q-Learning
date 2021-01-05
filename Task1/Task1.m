clc;
clear;

% load the reward matrix
load('task1.mat');


threshold = 0.5; % set convergence threshold to determine if q values have converged to q*
Total_runs = 10;
reached_goal = zeros(4,2); % variable to store number of goal_ReachedRuns
time2exec = zeros(4,2); % the average execution time of goal reaching runs
test_gammas = [0.5, 0.9]; % gamma the discount factor
opt_pol_state_trans = []; % column vector containing the state transitions 
opt_pol_reward = []; % reward associated with optimal policy

% calculate for gamma = 0.5 and 0.9
for i=1:length(test_gammas)
disc_fac = test_gammas(i); % discount factor
    
    % calcualte for 4 functions of epsilon_k (exploration probability) and
    % alpha_k (learning rate) also known as decay method, decay_meth
    for decay_meth=[1 2 3 4]    
     
        Q_vals = zeros(100, 4, Total_runs); % stores Q values
        suc_runs = zeros(Total_runs, 1);    % success runs = no. of goals reached divided by no. of runs
        optim_pol = zeros(100, Total_runs); % stores optimal policy / actions 
        Final_Reward = zeros(Total_runs, 1);% Total reward after reaching Stop state
        timer = zeros(Total_runs,1);        % stores the time for calculating Q* values
        
        % Parallel running to improve efficiency
        parfor r = 1:Total_runs 
            [Q_vals(:,:,r), ~, timer(r), suc_runs(r)] = ...         
                        Q_Trials(reward, disc_fac, decay_meth, ...      % caculate the Q values 
                        decay_meth, threshold, false);                  
            optim_pol(:,r) = cal_Optim_Pol(Q_vals(:,:,r));              % Optimal policy takes actions with max Q values
            Final_Reward(r) =  cal_reward(optim_pol(:,r), reward);      % calculate total reward for 100 states 
        end
        
        goal_ReachedRuns = find(Final_Reward > 0);                      % reward is +ve for goal reached runs, count no. of +Ve rewards
        reached_goal(decay_meth,i) = length(goal_ReachedRuns);          % count no. of goal reached runs
        time2exec(decay_meth,i) = mean(timer(goal_ReachedRuns));        % find average time of execution for goal reached runs
        % Plot the trajectory
        disp(['Computing gamma = ', num2str(disc_fac),' epsilon/alpha k type = ', int2str(decay_meth)]);
        
        if ~isempty(goal_ReachedRuns)                                   % plot only if goal was reached
           visited_states = plott(optim_pol(:,max(goal_ReachedRuns)));                  % plot trajectory optimal goal reached run
            title(['Optimal trajectory with gamma - ', num2str(disc_fac) , ', Total reward - ', ...
                        num2str(Final_Reward(max(goal_ReachedRuns)))])
                    
         opt_pol_state_trans = [opt_pol_state_trans, visited_states']; 
         opt_pol_reward = [opt_pol_reward Final_Reward(max(goal_ReachedRuns))];
                  
        end
       
    end
end
Table_1 = [reached_goal, time2exec]     % display no. of goal reached runs and execution time as required in table 1

        
        
