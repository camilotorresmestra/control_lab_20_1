%This is a script to sweep through an array of 
%proportional constants and find the better choice for
%the plant in the simulation

Kp_vals=6.1:0.1:8;
for i = 1:length(Kp_vals)
    simIn(i) = Simulink.SimulationInput('PlantSimulationLABC_V3_R2019b');
    simIn(i) = setVariable(simIn(i),'Kp',Kp_vals(i));
end
simOutputs = sim(simIn);