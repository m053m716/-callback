function echo(src, evt)
%ECHO  Echo tcpclient/tcpserver interaction string message (terminator-configured) to command window.
%
% Syntax:
%   callback.echo(src, evt);
%
% Example:
%   server = tcpserver(...);
%   configureTerminator(server, "LF");
%   configureCallback(server, 'terminator', @callback.echo);
%
% Inputs:
%   src - Handle for which this callback was configured (typically,
%           tcpserver)
%   evt - Eventdata sent when the callback was triggered.
%
% See also: Contents, tcpserver, tcpclient

assignin('base', 'evt', evt);
if isstruct(src.UserData) && isfield(src.UserData, 'tag')
    fprintf(1, ">> %s::Server-%s::%s\n", evt.AbsoluteTime, src.UserData.tag, readline(src));
else
    fprintf(1, ">> %s::%s\n", evt.AbsoluteTime, readline(src));
end

end