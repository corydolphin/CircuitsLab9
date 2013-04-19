function saveformatfig(path,filename)
% saveformatfig
%   Sets the title, axes, axes label, and legend font size of the current 
%   figure. Also saves the current figure to `path` as `filename` in EPS, 
%   PNG and FIG formats.
    fig = gcf;
    all_ax = findobj(fig,'Type','axes');
    
    for i=1:length(all_ax) %in order to support subplots
        ax = all_ax(i);
        ylbl = get(ax,'ylabel');
        xlbl = get(ax,'xlabel');
        title = get(ax,'Title');
        leg = findobj(fig,'Type','axes','Tag','legend');
        set(title,'FontSize',35);
        if ~strcmp(get(ax,'Tag'),'legend')
            set(ylbl,'FontSize',25);
            set(xlbl,'FontSize',25);
            set(ax,'FontSize',18);
        end
        set(leg,'FontSize',20);
    end
    
    saveas(fig, strcat(path,filename,'.eps'),'eps2c')
    saveas(fig, strcat(path,filename,'.png'))
    saveas(fig, strcat(path,filename,'.fig'))
    close(fig);
end
