load('Data/Exp3LargeSignalCh1.isf');
load('Data/Exp3LargeSignalCh2.isf');


Exp3LargeSignalCh2(:,2) = Exp3LargeSignalCh2(:,2) + 1.1;

[lval,lbound] = min(abs(Exp3LargeSignalCh2(:,1)));
[rval,rbound] = min(abs(Exp3LargeSignalCh2(:,1) - 0.3e-4));


p = polyfit(Exp3LargeSignalCh2(lbound:rbound,1), Exp3LargeSignalCh2(lbound:rbound,2),1);

plot(Exp3LargeSignalCh1(:,1), Exp3LargeSignalCh1(:,2)); hold on;
plot(Exp3LargeSignalCh2(:,1), Exp3LargeSignalCh2(:,2), 'r'); hold on;
plot(Exp3LargeSignalCh2(:,1), p(1).*Exp3LargeSignalCh2(:,1) + p(2), 'g', 'LineWidth',2);

ylim([2,4.5]);
xlabel('Time (seconds)');
ylabel('Amplitude (Volts)');
legend('V_{in}','V_{out}',...
 strcat('Linear fit to extract slew rate, ', num2str(p(1),4)),...    
 'Location','SouthEast');
title('Large Signal Step Response of a Unity-Gain Voltage Follower');