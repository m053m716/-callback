function handleStreamBufferFilledEvent__UA(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__UA  Callback for FrameFilledEvent from StreamBuffer class (Unipolar Averaging).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__UA(src, evt, visualizer);

data = ([[1, mean(src.samples(subset,:), 1)]; ... % Prepend 1 indicating first moment
         [2, std(src.samples(subset,:),0,1)]; ... % Prepend 0 to indicate "time" channel
         [0, src.index./src.sample_rate]])'; ...  % Prepend 2 indicating second moment
visualizer.write(data(:), "double");

end