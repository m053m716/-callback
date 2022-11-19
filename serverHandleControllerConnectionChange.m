function serverHandleControllerConnectionChange(src, ~)
%SERVERHANDLECONTROLLERCONNECTIONCHANGE  For handling connection changes (CONTROLLER server).

if src.Connected
    pause(3); % Give it a second, then send the data.
    [~, tank, ~] = fileparts(src.UserData.tank);
    writeline(src, sprintf('%s.%s', tank, src.UserData.block));
end
end