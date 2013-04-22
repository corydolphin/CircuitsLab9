load('Data/Exp3LargeSignalCh1.isf');
load('Data/Exp3LargeSignalCh2.isf');
plot(Exp3LargeSignalCh1(:,1), Exp3LargeSignalCh1(:,2)); hold on;
plot(Exp3LargeSignalCh2(:,1), Exp3LargeSignalCh2(:,2) +1.1, 'r');