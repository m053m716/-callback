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
        
    case 'BA'
        
    case 'UR'
        
    case 'IR'
        
    case 'RC'
        
    otherwise
        fprintf(1,"Unhandled mode: %s\n", src.app.mode);
end
        
        
end