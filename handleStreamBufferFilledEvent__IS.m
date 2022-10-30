function handleStreamBufferFilledEvent__IS(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__IS  Callback for FrameFilledEvent from StreamBuffer class (ICA Stream).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__IS(src, evt, visualizer, subset);

data = ([[subset, src.samples(subset,:)]; ... % Prepend one sample indicating which channel
         [0, src.index./src.sample_rate]])';  % Prepend 0 to indicate "time" channel
visualizer.write(data(:), "double");

end