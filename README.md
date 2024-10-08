This is part of a graded assessment in the module EE5904, Neural Networks during Masters in NUS.

# Q-Learning for World Grid Navigation

## Project Description:
The objective of this project is to implement a Q-learning algorithm to enable an robot/agent to traverse a 10x10 grid from the start state to Stop state following an optimal policy. The optimal policy is the set of actions to be taken from an initial start state that will maximize the total reward of the trip/run when finishing at the final stop state. Unlike other learning techniques, Q-learning only uses reward information when moving to a new state and observing the state transition for an action. Other information like state transition probabilities are not required.

![image](https://github.com/user-attachments/assets/18f40d63-58c1-4b76-9dae-ba06d2194569)

![image](https://github.com/user-attachments/assets/aa633a96-15be-4f09-b3ac-9d92897aaa83)

## The principle of Q-Learning

![image](https://github.com/user-attachments/assets/95137dc8-bef5-4441-b23e-92cf31084817)

![image](https://github.com/user-attachments/assets/4fbdfe47-8881-4ce0-a797-866dfadca78d)

Exploitation
![image](https://github.com/user-attachments/assets/e262c988-2abb-429a-a58d-65fad7ade22f)
Exploration
![image](https://github.com/user-attachments/assets/858f0a3b-f7ee-4aa3-9593-4792a5a67adf)

# Results of Q-Learning

<img width="417" alt="image" src="https://github.com/user-attachments/assets/c0e51df9-1c69-40be-9237-406e0067ae4d">

![image](https://github.com/user-attachments/assets/3fdb4d67-0c45-4499-a421-2be2ca7d0b02)


## Trajectory of optimal policy that maximises reward
![image](https://github.com/user-attachments/assets/9b5dad34-d371-49fd-9a47-35ef033f04fc)


# Conclusion
Q-Learning allows an agent to exploit as well as explore the environment to as defined by the learning rate and exploration probability. It does not require knowledge of transitions probabilities. In this project we use rewards information to decide actions to take that maximises the total reward at the 100th state. The optimal parameters for this reward.mat was found to be decay method 2 and gamma = 0.9 which results in maximum reward of 7121 through 18 state transitions.
