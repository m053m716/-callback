function handleStreamBufferFilledEvent__BS(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__BS  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BS(src, evt, visualizer);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");

disp("Bipolar stream handling not configured.");

end