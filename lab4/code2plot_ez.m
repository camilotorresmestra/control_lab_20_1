close all
b=1
t=sat_linear{3}.Values.Time(b:end);
t_n=non_sat_linear{3}.Values.Time(b:end)
hold off
data_sat=sat_linear{3}.Values.Data(b:end);
data_non_sat=non_sat_linear{3}.Values.Data(b:end);
plot(t,data_sat)
hold on
plot(t_n,data_non_sat)
legend({'Con saturación','Sin saturación'},'Location','southwest')
xlabel('Tiempo [s]')
ylabel('Error de posción [°]')
xticks([0:1:15])
yticks([0:1:15])
grid on