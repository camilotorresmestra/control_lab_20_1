%This is a script to sweep through an array of 
%proportional constants and find the better choice for
%the plant in the simulation

w_vals=0.1:.1:10;
for i = 1:length(w_vals)
    simIn(i) = Simulink.SimulationInput('linear_simulation');
    simIn(i) = setVariable(simIn(i),'w',w_vals(i));
end
simOutputs = sim(simIn);
%%
w_vals=0.1:.1:10;
for i = 1:length(w_vals)
    simIn(i) = Simulink.SimulationInput('PlantSimulationLABC_V3_R2019b');
    simIn(i) = setVariable(simIn(i),'w',w_vals(i));
end
simOutputs = sim(simIn);
%%
i=1;
b=1;
t=simOutputs(1, i).logsout{3}.Values.Time(b:end);
%errors_i=zeros(length(t),length(w_vals));
errors_mu=zeros(length(w_vals),1);
for i=1:100
    %errors_i(:,i)=simOutputs(1, i).logsout{3}.Values.Data(b:end);
    errors_mu(i)=rms(simOutputs(1, i).logsout{3}.Values.Data(b:end));
end
%%
%Code for plot
scatter(w_vals,errors_mu)
xlabel('\omega [rad/s]')
ylabel('Valor RMS del Error')
grid on