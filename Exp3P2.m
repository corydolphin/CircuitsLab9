load('Data/Exp3SmallSignalCh1.isf');
load('Data/Exp3SmallSignalCh2.isf');
%%%%%
%%%TODO: FIGURE OUT TIME DIMENSION AND RECREATE FITS
%%%
%%%
%%%%%
Exp3SmallSignalCh1(:,1) = Exp3SmallSignalCh1(:,1)+2.28e-4;
Exp3SmallSignalCh2(:,1) = Exp3SmallSignalCh2(:,1)+2.28e-4;

toFitToTime = Exp3SmallSignalCh1(5710:9650,1) - 2.2836e-4;
toFitToVoltage = Exp3SmallSignalCh2(5710:9650,2) -2.12686;

mx = mean(toFitToVoltage(462:end))*0.63;
ind = find(toFitToVoltage<mx+0.0002 & toFitToVoltage>mx - 0.0002);
tau1 = toFitToTime(ind(1));
tau2 = 1e-9/2.3687e-04;

voltage = 0.035 - 0.035*exp(-toFitToTime/tau1);
voltage2 = 0.035 - 0.035*exp(-toFitToTime/tau2);
plotting_voltage = zeros(1,10000);
plotting_voltage2 = zeros(1,10000);
plotting_voltage(5710:9650) = voltage;
plotting_voltage2(5710:9650) = voltage2;

toFitToTime = Exp3SmallSignalCh1(1750:5623,1) - 6.9960e-5;
toFitToVoltage = Exp3SmallSignalCh2(1750:5623,2) -2.12686;

voltage = 0.035*exp(-toFitToTime/tau1);
voltage2 = 0.035*exp(-toFitToTime/tau2);
plotting_voltage(1750:5623) = voltage;
plotting_voltage(1:1750) = max(voltage);
plotting_voltage = plotting_voltage + 2.12686;
plotting_voltage2(1750:5623) = voltage2;
plotting_voltage2(1:1750) = max(voltage2);
plotting_voltage2 = plotting_voltage2 + 2.12686;



plot(Exp3SmallSignalCh1(:,1), Exp3SmallSignalCh1(:,2),'.'); hold on;
plot(Exp3SmallSignalCh2(:,1), Exp3SmallSignalCh2(:,2) +1.1, '.r');
plot(Exp3SmallSignalCh2(:,1),plotting_voltage + 1.1,'g','LineWidth',4);
plot(Exp3SmallSignalCh2(:,1),plotting_voltage2 + 1.1,'k--','LineWidth',3);
ylim([3.22 3.27]);
xlim([0 3.8e-4])
xlabel('Time (seconds)');
ylabel('Amplitude (Volts)');
legend('V_{in}','V_{out}','Extracted Fit with \tau = 3.48 \times 10^{-6}','Theoretical Fit with \tau = 4.22 \times 10^{-6}','Location','SouthEast');
title('Small Signal Step Response of a Unity-Gain Voltage Follower')