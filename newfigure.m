function newfigure(varargin)
% newfigure
%   Opens a new figure in full screen. Optional argument is the figure
%   number to open (e.g. figure(2))
if isempty(varargin)
    nextFig = length(get(0,'CurrentFigure')) + 1;
    figure(nextFig);
else
    figure(varargin(1))
end
set(gcf,'visible','on'); %hide the graph
screen_size = get(0, 'ScreenSize');
set(gcf, 'Position', [0 0 screen_size(3) screen_size(4) ] ); %set to scren size
set(gcf,'PaperPositionMode','auto') %set paper pos for printing
end