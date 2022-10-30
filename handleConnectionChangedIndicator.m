function handleConnectionChangedIndicator(src, AppUserDataField, LampName)
%HANDLECONNECTIONCHANGEDINDICATOR  For handling connection indicator lamp.
%
% Syntax:
%   callback.handleConnectionChangedIndicator(src, AppUserDataField, LampName);
%
% Example:
%   srv = tcpserver(..., ...
%           'UserData', struct('app', myApp, 'otherfield1', ...), ...
%           'ConnectionChangedFcn', @(src, ~)callback.handleConnectionChangedIndicator(src, "app", "DataConnectionStatusLamp"));
%
% Inputs:
%   src - TCPserver object. This will be the event source, which is
%       typically automatically passed by MATLAB. Note that you need to
%       suppress the eventdata (second input argument that is automatically
%       passed by MATLAB), see the example above.
%   AppUserDataField - Name of struct field in UserData property of server
%                       object. So in the above example, this is "app".
%   LampName - Name of the "Connection Indicator" lamp in your application.
%                   So in the above example, this is
%                   "DataConnectionStatusLamp", which is a Lamp object in
%                   the `myApp` application.
%
% See also: Contents

if src.Connected
    if isstruct(src.UserData)
        if isfield(src.UserData, AppUserDataField)
            if ~isempty(src.UserData.(AppUserDataField))
                if isvalid(src.UserData.(AppUserDataField))
                    src.UserData.(AppUserDataField).(LampName).Color = [0.39,0.83,0.07];
                end
            end
        end
    end            
else
    if isstruct(src.UserData)
        if isfield(src.UserData, AppUserDataField)
            if ~isempty(src.UserData.(AppUserDataField))
                if isvalid(src.UserData.(AppUserDataField))
                    src.UserData.(AppUserDataField).(LampName).Color = [0.65,0.65,0.65];
                end
            end
        end
    end  
end
end