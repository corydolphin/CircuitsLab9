%Exp2P3
load('Data/Exp2P3.mat');
coeffs = polyfit(Vdm(275:365),-Iout(275:365),1);
plot(Vdm,-Iout,'o'); hold on;
plot(Vdm, Vdm * coeffs(1) + coeffs(2), '-', 'LineWidth', 2);
xlim([-2.5 2.5]);
ylim([-8e-5 7e-5]);
xlabel('V_{dm} (Volts)');
ylabel('I_{out} (Amps)');
title('I_{out} as a Function of V_{dm} for V_{out} = 2.5 V');
legend('Data',strcat('G_m = ', '2.3687\times 10^{-4}', '  \Omega^{-1}'),'Location','NorthWest');
gm = coeffs(1);