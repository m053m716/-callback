function serverVisualizationCallbackWrapper(src, evt)
%SERVERVISUALIZATIONCALLBACKWRAPPER  Wrapper callback for server with online data visualization application interface in UserData 'app' field.
%
% Syntax:
%   callback.serverVisualizationCallbackWrapper(src, evt);
%
% See also: callback, deploy__tmsi_tcp_servers, SAGA_Data_Visualizer

switch src.UserData.app.mode
    case 'US'
        msg = read(src, src.UserData.n+1, "double");
        src.UserData.app.update_unipolar_stream_data(msg(1), msg(2:end));
    case 'BS'
        msg = read(src, src.UserData.n+1, "double");
        src.UserData.app.update_bipolar_stream_data(msg(1), msg(2:end));        
    case 'UA'
        msg = read(src, src.UserData.n+1, "double");
        src.UserData.app.update_unipolar_average_data(msg(1), msg(2:end));
        
    case 'BA'
        msg = read(src, src.UserData.n+1, "double");
        src.UserData.app.update_bipolar_average_data(msg(1), msg(2:end));
        
    case 'UR'
        disp("Unipolar raster mode not yet implemented.");
        
    case 'IS'
%         msg = read(src, src.UserData.n+1, "double");
%         src.UserData.app.update_ica_stream_data(msg(1), msg(2:end));
        disp("ICA mode not yet implemented.");
        
    case 'IR'
        disp("ICA raster mode not yet implemented.");
        
    case 'RC'
        disp("RMS Contour mode not yet implemented.");
        
    otherwise
        fprintf(1,"Unhandled mode: %s\n", src.app.mode);
end
        
        
end