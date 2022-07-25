#### Run the simulation for the centrailized controller

- Open `set_param.m` to set the parameters for the simulation.
- Run `main.m` to perform the simulation and generate figures.


#### Visualization and Evaluation
The program runs and all the data is logged by the DataLogger (Source/Tools/DataLogger.m) module.

User may pause the execution and use the DataLogger module for the evaluation.

Use the instance of class DataLogger from the "Main.m" file to plot stuffs. Example

```
% Breakpoint during the main loop of Main.m
Logger.plot_Lyapunov()
Logger.plot_control_output()
Logger.plot_VM_trajectories()
...
```

User can implement a child class of Logger to clarify how they want to adjust the figures, e.g., LineWdith, Boudary Lines, etc.

## License

MIT

**Free Software, Hell Yeah!**
