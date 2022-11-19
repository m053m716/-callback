function clientHandleControllerMessages(src, ~)
%CLIENTHANDLECONTROLLERMESSAGES  Read callback for CONTROLLER client.
%
% This callback function should handle routing of different string
% requests. The syntax for client methods should be:
%
%   value = string(sprintf("%s.%s", TANK, BLOCK));
%   writeline(server, value);


data = readline(src);
info = strsplit(data, '.');
src.UserData.BLOCK = str2double(info{2});
src.UserData.tank_2_meta_and_event(info{1});

end