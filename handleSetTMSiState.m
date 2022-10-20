function handleSetTMSiState(client, state)
%HANDLESETTMSISTATE  Set SAGA controller/device state.
%
% Example:
% >> callback.handleSetTMSiState(client, "run");
%
% Syntax:
%   callback.handleSetTMSiState(client, state);
%
% Inputs:
%   client - tcpclient that is connected to CONTROLLER tcpserver
%   state  - "idle" | "run" | "imp" | "rec" | "quit"

state_expr = sprintf('set.state.%s', state);
writeline(client, state_expr);
end