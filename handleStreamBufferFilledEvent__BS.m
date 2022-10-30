function handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__BS  Callback for FrameFilledEvent from StreamBuffer class (Bipolar Stream).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BS(src, evt, visualizer, subset);

data = ([[subset - 65, src.samples(subset,:)]; ... % Prepend one sample indicating which channel
         [0, src.index./src.sample_rate]])';   ... % Prepend 0 to indicate "time" channel
visualizer.write(data(:), "double");

end