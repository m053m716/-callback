function serverVisualizationCallbackWrapper(src, evt)
%SERVERVISUALIZATIONCALLBACKWRAPPER  Wrapper callback for server with online data visualization application interface in UserData 'app' field.
%
% Syntax:
%   callback.serverVisualizationCallbackWrapper(src, evt);
%
% See also: callback, deploy__tmsi_tcp_servers, SAGA_Data_Visualizer

switch src.app.mode
    case 'US'
        n_data = src.UserData.n.samples * src.UserData.n.channels;
        data = reshape(read(src, n_data, "double"), src.UserData.n.samples, src.UserData.n.channels);
    case 'BS'
        
    case 'UA'
        
    case 'BA'
        
    case 'UR'
        
    case 'IR'
        
    case 'RC'
        
    otherwise
        fprintf(1,"Unhandled mode: %s\n", src.app.mode);
end
        
        
end