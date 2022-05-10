function handleCommonWindowKeyPresses(src, evt, save_name, keep_fig)
%HANDLECOMMONWINDOWKEYPRESSES  Callback for common hot-key combinations.
if nargin < 4
    keep_fig = true; 
end

% Handles the different key combinations:
switch evt.Key
    case 'e'  % Export
        if ismember('control', evt.Modifier)
            export_manual_figure_save(src, save_name, keep_fig);
        end
    case 't'  % Add a threshold to everything
        if ismember('control', evt.Modifier)
            add_threshold_to_all_axes(src);     
        end
    case 'escape'
        remove_fiducial_marker_from_all_axes(src);
end

% % % Actual callbacks are below % % %
    function add_threshold_to_all_axes(src)
        L = findobj(src.Children, 'Type', 'tiledlayout');
        if isempty(L)
            ax = findobj(src.Children, 'Type', 'axes');
        else
            ax = findobj(L.Children, 'Type', 'axes'); 
        end
        add_sd_threshold(ax, 6.5);  
    end

    function export_manual_figure_save(src, save_name, keep_fig)
        tic;
        fprintf(1, '\t->\tPlease wait, saving <strong>%s</strong>...', save_name);
        default.savefig(src, save_name, 'manual_export', keep_fig);
        fprintf(1, 'complete.\n');
        toc; 
    end

    function remove_fiducial_marker_from_all_axes(src)
        L = findobj(src.Children, 'Type', 'tiledlayout');
        if ~isempty(L)
            callback.deleteTaggedElement(L, 'fiducial');
        else
            callback.deleteTaggedElement(src, 'fiducial');            
        end 
    end
% % % End callbacks % % %
end