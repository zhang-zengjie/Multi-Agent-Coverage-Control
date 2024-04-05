## Optimal Coverage Control of Multiple Constant-Speed Unicycle Robots (CSUR)

The experimental studies of a decentralized optimal coverage controller for multi-agent systems with multiple constant-speed unicycle robots (CSURs).

This project is associated with the publication [Distributed Coverage Control of Constrained Constant-Speed Unicycle Multi-Agent Systems](https://ieeexplore.ieee.org/abstract/document/10477934).

See a Youtube [video](https://www.youtube.com/watch?v=XUEx6HEZPAM) how this project performs.

### File Structure:

- *sim_main.m*: the main script to generate simulation results.
- *exp_main.m*: the main script to generate experimental results.
- */src*: the source files.
- */lib*: the library files. 
- */data*: the data files (go to this folder and download the data according to `ReadMe.md`, before running the code).


### Generate figures of the simulation results

Run the `sim_main.m` script to generate figures for simulation.

#### Simulation study 1: different initial conditions

- Go to `sim_main.m`, change parameter setting script to `set_sim_case_1_param`, `set_sim_case_1_param`, or `set_sim_case_1_param`, for case 1, 2, or 3, respectively.
- Run
```
sim_main
```
#### Simulation study 2: different parameters

- Go to `sim_main.m`, change parameter setting script to `set_sim_eps_10_param`, `set_sim_gamma_10_param`, or `set_sim_Q_10_param`, for the influence of $\varepsilon$, $\gamma$, or $Q$, respectively.
- Run
```
sim_main
```

#### Simulation study 3: large number of robots

- Go to `sim_main.m`, change parameter setting script to `set_sim_large_param`.
- Run
```
sim_main
```

#### Simulation study 4: comparison with the conventional controller

- Go to `sim_main.m`, change parameter setting script to `set_sim_proposed_param` or `set_sim_conv_param`, for the proposed controller or the conventional controller, respectively.
- Run
```
sim_main
```

### Generate figures of the experimental results

- Go to `exp_main.m`, change the case number to `'1'`, `'2'`, or`'3'`, for case 1, 2, or 3, respectively.
- Run
```
exp_main
```





 

