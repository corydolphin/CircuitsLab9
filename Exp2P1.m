% For a single value of the inverting input voltage, sweep the noninverting input around the
% inverting one in ?ne increments while measuring Vout. You should try to get several points
% in the high-gain region. Fit a straight line to the steep part of the curve and determine
% the di?erential-mode voltage gain of your circuit from the slope of the best-?t line. In your
% report, include a plot showing Vout versus V
% dm along with the best-?t line.

load('Data/Exp2P1');
interval = 1;
figure(1);
plot(Vdm(1:interval:end), Vout(1:interval:end),'b*','MarkerSize',10, 'LineWidth', 1); hold on;

t_lbound = abs(Vdm + 0.015);
t_rbound = abs(Vdm - 0.022);
[~, lbound] = min(t_lbound); %index of closest value
[~, rbound] = min(t_rbound); %index of closest value

p = polyfit(Vdm(lbound:rbound),Vout(lbound:rbound),1);

Vout_fit = p(1).*Vdm + p(2);
plot(Vdm,Vout_fit, 'r', 'Linewidth',2);
ylim([-0.5,5.5]);

title('Differential-mode gain');
xlabel('Differential-mode Voltage V_{dm} (V)');
ylabel('Output Voltage (V)');

h = legend('Experimental V_{out}',...
 strcat('Differential mode gain, linear fit for V_{out}=', num2str(p(1)), 'V_{dm} ', ' + ' , num2str(p(2))),...
 'Location','SouthEast');