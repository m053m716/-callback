function handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__BS  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");
data = ([subset - 65, src.samples(subset,:)])'; % Prepend one sample indicating which channel
visualizer.write(data(:), "double");

end