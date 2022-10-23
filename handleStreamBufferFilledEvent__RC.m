function handleStreamBufferFilledEvent__RC(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__RC  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__RC(src, evt, visualizer);

[~, idx] = sort(src.index, 'ascend');
data = src.samples(:, idx)';
visualizer.write(data(:), "double");

end