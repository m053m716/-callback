function handleStreamBufferFilledEvent__US(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__US  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__US(src, evt, visualizer, subset);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx);
data = ([subset, src.samples(subset,:)])'; % Prepend one sample indicating which channel
visualizer.write(data(:), "double");

end