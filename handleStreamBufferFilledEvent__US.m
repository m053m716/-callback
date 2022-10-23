function handleStreamBufferFilledEvent__US(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__US  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__US(src, evt, visualizer);

[~, idx] = sort(src.index, 'ascend');
data = src.samples(:, idx)';
visualizer.write(data(:), "double");

end