function handleStreamBufferFilledEvent__BA(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__BA  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BA(src, evt, visualizer);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");

disp("Bipolar average handling not configured.");

end