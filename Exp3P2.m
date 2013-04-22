clear;
load('Data/Exp3SmallSignalCh1.isf');
load('Data/Exp3SmallSignalCh2.isf');
%%%%%
%%%TODO: FIGURE OUT TIME DIMENSION AND RECREATE FITS
%%%
%%%
%%%%%
toFitToTime = Exp3SmallSignalCh1(5710:6700,1);
toFitToVoltage = Exp3SmallSignalCh2(5710:6700,2) -2.12686;
clf;
subplot(3,1,1);
plot(toFitToTime,toFitToVoltage,'.'); hold on;
mx = mean(toFitToVoltage(462:end))*0.63;
ind = find(toFitToVoltage<mx+0.0002 & toFitToVoltage>mx - 0.0002);
tau = toFitToTime(ind(1));


voltage = 0.035 - 0.035*exp(-toFitToTime/tau);
plotting_voltage = zeros(1,10000);
plotting_voltage(5710:6700) = voltage;

toFitToTime = Exp3SmallSignalCh1(1750:5623,1);
toFitToVoltage = Exp3SmallSignalCh2(1750:5623,2) -2.12686;
voltage = 0.035 - 0.035*exp(toFitToTime/tau);
subplot(3,1,2)
% plot(toFitToTime,voltage);
plot(toFitToTime,toFitToVoltage,'.'); hold on;
% plot(toFitToTime,voltage,'r');
plotting_voltage(1750:5623) = voltage;
plotting_voltage = plotting_voltage + 2.12686;

subplot(3,1,3)
plot(Exp3SmallSignalCh1(:,1), Exp3SmallSignalCh1(:,2)); hold on;
plot(Exp3SmallSignalCh2(:,1), Exp3SmallSignalCh2(:,2) +1.1, 'r');
plot(Exp3SmallSignalCh2(:,1),plotting_voltage + 1.1,'g');
ylim([3.22 3.27]);
xlim([-2.5e-4 2e-4])
