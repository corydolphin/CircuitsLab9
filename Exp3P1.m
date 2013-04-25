load('Data/Exp3LargeSignalCh1.isf');
load('Data/Exp3LargeSignalCh2.isf');


Exp3LargeSignalCh2(:,2) = Exp3LargeSignalCh2(:,2) + 1.1;

[lval,lbound] = min(abs(Exp3LargeSignalCh2(:,1)));
[rval,rbound] = min(abs(Exp3LargeSignalCh2(:,1) - 0.3e-4));


p = polyfit(Exp3LargeSignalCh2(lbound:rbound,1), Exp3LargeSignalCh2(lbound:rbound,2),1);


[~,lbound2] = min(abs(Exp3LargeSignalCh2(:,1) +0.0001526 ));
[~,rbound2] = min(abs(Exp3LargeSignalCh2(:,1) + 0.000134 ));


p2 = polyfit(Exp3LargeSignalCh2(lbound2:rbound2,1), Exp3LargeSignalCh2(lbound2:rbound2,2),1);

plot(Exp3LargeSignalCh1(:,1), Exp3LargeSignalCh1(:,2), '.'); hold on;
plot(Exp3LargeSignalCh2(:,1), Exp3LargeSignalCh2(:,2), 'r.'); hold on;
plot(Exp3LargeSignalCh2(:,1), p(1).*Exp3LargeSignalCh2(:,1) + p(2), 'g', 'LineWidth',2);
plot(Exp3LargeSignalCh2(:,1), p2(1).*Exp3LargeSignalCh2(:,1) + p2(2), 'c', 'LineWidth',2.5);
IbLowerBound = -70.71e-6;
IbUpperBound = 66.69e-6;
c = 1e-9;

ylim([2,4.5]);
xlabel('Time (seconds)');
ylabel('Amplitude (Volts)');
legend('V_{in}','V_{out}',...
 strcat('Linear fit to rising slew rate, ', num2str(p(1),4),' V/s'),...    
strcat('Linear fit to falling slew rate, ', num2str(p2(1),4),' V/s'),...
'Location','SouthEast');
title('Large Signal Step Response of a Unity-Gain Voltage Follower');