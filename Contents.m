% +CALLBACK  Package with common callback functions for UI interactions and client/server interactions.
%
% Files
%   chain                        - Chain together multiple callbacks
%   deleteTaggedElement          - Delete any child object with the tag `tag` from all child axes.
%   echo                         - Echo tcpclient/tcpserver interaction string message (terminator-configured) to command window.
%   exportFigures                - Handles figure export based on delimited string message.
%   handleAxesClick              - Callback included with figure userdata so that axes can clicked on.
%   handleCommonWindowKeyPresses - Callback for common hot-key combinations.
%   handleSetTMSiState           - Set SAGA controller/device state.
%   handleTMSiRecNameMetadata    - Set recording name metadata using consistent convention.
