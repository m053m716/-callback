function chain(~, ~, varargin)
%CHAIN Chain together multiple callbacks
%
% Syntax:
%   callback.chain(@cb1, @cb2,  ...);
%
% Inputs:
%   varargin - Each optional argument is an additional callback to execute,
%               so a single uicontrol element for example can have multiple
%               callback functions chained and appended to as needed.
%
% Example 1:
%   fig = uifigure;
%   btn = uibutton(fig, 'Text', 'Test', 'ButtonPushedFcn', {@callback.chain; {@disp, "A"}});
%   % Press the button, it prints "A" to the command window.
%   set(btn,'ButtonPushedFcn',[btn.ButtonPushedFcn; {{@disp; "B"}}]);
%   % Press the button, it should print "A" then print "B" in command window.
%
% This is useful for instance if you have initialized a GUI element
% related to some other process and you need to still initialize that
% process but maybe don't want to automatically do that on startup of the
% GUI itself. Now, you can "append" to its callback chain as you initialize
% various sub-processes and still get the desired functionality.
%
% See also: Contents, Metadata_Interface, Muscle_Map_Exporter

for iV = 1:numel(varargin)
    feval(varargin{iV}{:});
end

end