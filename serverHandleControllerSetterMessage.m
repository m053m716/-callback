function tf = serverHandleControllerSetterMessage(src, raw_field_in, raw_value_in)
%SERVERHANDLECONTROLLERSETTERMESSAGE  Handles "set" messages sent to TMSi controller server.

f = strtrim(string(lower(raw_field_in)));
if ismember(class(src.UserData.(f)), ["string", "char"])
    val = string(strtrim(raw_value_in));
    src.UserData.(f) = val;
    fprintf(1, "CONTROLLER::RECV::%s=%s\n", f, val);
    switch f
        case "state"  % Then broadcast the state change.
            msg = [char(src.UserData.state) 10];
            src.UserData.udp.write(msg, ...
                "string", src.UserData.address, src.UserData.port.state);
        case "file"
            msg = [char(fullfile(src.UserData.datashare, src.UserData.file)) 10];
            src.UserData.udp.write(msg, ...
                "string", src.UserData.address, src.UserData.port.name);
        otherwise
            msg = [char(sprintf("%s.%s", raw_field_in, raw_value_in)) 10];
            src.UserData.udp.write(msg, ...
                "string", src.UserData.address, src.UserData.port.extra);
    end
    fprintf(1, "\t->\tCONTROLLER::SENT::%s\n",msg);
    tf = true;
else
    tf = false;
end
end