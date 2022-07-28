## Optimal Constrained Control of a Multi-Unicycle System

### File Structure:

- *sim_main.m*: the main script to generate simulation results.
- *exp_main.m*: the main script to generate experimental results.
- */src*: the source files.
- */lib*: the library files. 
- */data*: the data files (data stored in cloud drive).

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





 

