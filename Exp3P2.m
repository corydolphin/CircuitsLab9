load('Data/Exp3SmallSignalCh1.isf');
load('Data/Exp3SmallSignalCh2.isf');
plot(Exp3SmallSignalCh1(:,1), Exp3SmallSignalCh1(:,2)); hold on;
plot(Exp3SmallSignalCh2(:,1), Exp3SmallSignalCh2(:,2) +1.1, 'r');