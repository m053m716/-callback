function handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__BS  Callback for FrameFilledEvent from StreamBuffer class (Bipolar Stream).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset);

[t,sample_order] = sort(src.index./src.sample_rate, 'ascend');
samples = src.samples(:, sample_order);
data = ([[subset - 65, samples(subset,:)]; ... % Prepend one sample indicating which channel
         [0, t]])';   ... % Prepend 0 to indicate "time" channel
visualizer.write(data(:), "double");

end