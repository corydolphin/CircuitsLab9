%Exp2p2
load('Data/Exp2P2.mat')
%31 259
coeffs = polyfit(Vout(31:259), Iout(31:259),1);
plot(Vout,Iout,'o'); hold on;
plot(Vout,Vout * coeffs(1) + coeffs(2),'-','LineWidth',2);
xlim([0 5]);
% ylim([-14e-4 2e-4]);
xlabel('V_{out} (Volts)');
ylabel('I_{out} (Amps)');
title('I_{out} as a Function of V_{out} with V_{dm} = 0');
legend('Data',strcat('Incremental Output Resistance R_{out} = 489.56 k\Omega'),'Location','SouthEast');
rout = 1/coeffs(1);