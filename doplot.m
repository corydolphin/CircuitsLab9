function doplot(path_to_mfile,figure_folder_path,figure_name)
newfigure();
run(path_to_mfile);
saveformatfig(figure_folder_path,figure_name);
end