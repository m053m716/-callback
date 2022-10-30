function handleStreamBufferFilledEvent__US(src, evt, visualizer, subset)
%HANDLESTREAMBUFFERFILLEDEVENT__US  Callback for FrameFilledEvent from StreamBuffer class (Unipolar Stream).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__US(src, evt, visualizer, subset);

data = ([[subset, src.samples(subset,:)]; ... % Prepend one sample indicating which channel
         [0, src.index./src.sample_rate]])';  % Prepend 0 to indicate "time" channel
visualizer.write(data(:), "double");

end