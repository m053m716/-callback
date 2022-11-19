function serverHandleControllerMessages(src, ~)
%SERVERHANDLECONTROLLERMESSAGES  Read callback for CONTROLLER server.
%
% This callback function should handle routing of different string
% requests. The syntax for client methods should be:
%
%   value = string(sprintf("%s.%s", field, val));
%   writeline(client, value);
%
% Where client is a tcpclient object connected to this tcpserver.
%   -> field -- the UserData struct field of this server to write to
%   -> val   -- The value (string) to send to that field
%
% Note that all fields are auto lower-case so take that into consideration
% when setting up tcpserver object UserData. The value is not auto
% lower-case'd and just uses the string from readline. 
%
% Current fields:
%   -> 'state'  : "idle" (default) | "run" | "rec" | "quit"
%   -> 'datashare' : Should be wherever you want to save data when state is
%                   "rec". 
%   -> 'tank' : This is auto-parsed if you use
%               client__set_rec_name_metadata so please refer to that
%               function but basically it's the datashare subfolder that
%               recordings go into.
%   -> 'block' : Should be a string, but this is typically "0", "1", ... etc.
%               to key you into some metadata table where each row contains
%               various metadata entries on whatever is relevant to your
%               experiment...
%   -> 'file' : Should be whatever you want for the filename prefix when
%               state is "rec". The full filename will be:
%                   >> fname = sprintf("%s_%s",server.UserData.file,...
%                                                server.UserData.id);
%                   >> fullfile(server.UserData.folder, fname);
%   
% DISCLAIMER: 
%   -> I don't pretend to understand IT security etc. etc. -- use my shitty
%           code at your own risk! <-

while src.NumBytesAvailable > 0
    data = readline(src);
    info = strsplit(data, '.');
    switch info{1}
        case 'set'
            if ~callback.serverHandleControllerSetterMessage(src, info{2}, info{3})
                fprintf(1, "CONTROLLER::SET::INVALID=%s\n", data);
            end
        case 'get'
            switch string(strtrim(lower(info{2})))
                case "prop"
                    f = strtrim(string(lower(info{3})));
                    if ismember(class(src.UserData.(f)), ["string", "char"])
                        writeline(src, src.UserData.(f));
                    else
                        fprintf(1, "CONTROLLER::GET::INVALID=%s\n", data);
                        return;
                    end
                case "recv"
                    
                otherwise
                    fprintf(1, "CONTROLLER::GET::INVALID=%s\n", data);
                    return;
            end
        case 'vis'
            fprintf(1,'Received command: %s\n', data);
		    tag = info{3};
            vserver = src.UserData.visualizer.(tag); 
            switch info{2}
                case 'US' %Unipolar stream
                    n_samples = vserver.UserData.app.cfg.SAGA.Channels.n.samples + 1;
                    configureCallback(vserver, "byte", 8*n_samples, ...
                        @(src, evt)callback.serverVisualizationCallbackWrapper(src, evt));
                    % <mode>.<tag>.<apply_car>.<i_subset>
                    msg = [char(sprintf("%s.%s.%s.%s", info{2}, tag, info{4}, info{5}))];
                    src.UserData.udp.writeline(msg, src.UserData.address, src.UserData.port.extra); 
                case 'BS' %Bipolar stream
                    n_samples = vserver.UserData.app.cfg.SAGA.Channels.n.samples + 1;
                    configureCallback(vserver, "byte", 8*n_samples, ...
                        @(src, evt)callback.serverVisualizationCallbackWrapper(src, evt));
                    % <mode>.<tag>.<i_subset>
                    msg = [char(sprintf("%s.%s.%s", info{2}, tag, info{4}))];
                    src.UserData.udp.writeline(msg, src.UserData.address, src.UserData.port.extra); 
                case 'UA' %Unipolar averages
                    n_samples = vserver.UserData.app.cfg.SAGA.Channels.n.samples + 1;
                    configureCallback(vserver, "byte", 8*n_samples, ...
                        @(src, evt)callback.serverVisualizationCallbackWrapper(src, evt));
                    % <mode>.<tag>.<apply_car>.<sample_ch>
                    msg = [char(sprintf("%s.%s.%s.%s", info{2}, tag, info{4}, info{5}))];
                    src.UserData.udp.writeline(msg, src.UserData.address, src.UserData.port.extra); 
                case 'BA' %Bipolar averages
                    n_samples = vserver.UserData.app.cfg.SAGA.Channels.n.samples + 1;
                    configureCallback(vserver, "byte", 8*n_samples, ...
                        @(src, evt)callback.serverVisualizationCallbackWrapper(src, evt));
                    % <mode>.<tag>.<sample_ch>
                    msg = [char(sprintf("%s.%s.%s", info{2}, tag, info{4}))];
                    src.UserData.udp.writeline(msg, src.UserData.address, src.UserData.port.extra); 
                case 'UR' %Unipolar raster
                    msg = '(UR not handled -- no message)';
                case 'IR' %ICA raster
                    msg = '(IR not handled -- no message)';
                case 'RC' %RMS contour
                    msg = '(RC not handled -- no message)';
                otherwise
                    fprintf(1,'Unexpected visualization mode key: %s\n', string(lower(info{4})));
            end
            vserver.flush("input");
            fprintf(1,'Flushed server-%s input buffer.\n', tag);
            fprintf(1,'\t->\tSent message: %s\n', msg);
        otherwise
            error("Bad syntax on server request.");
    end
end
end