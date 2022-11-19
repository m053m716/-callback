function handleStreamBufferFilledEvent__US(src, evt, visualizer, subset, apply_car)
%HANDLESTREAMBUFFERFILLEDEVENT__US  Callback for FrameFilledEvent from StreamBuffer class (Unipolar Stream).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__US(src, evt, visualizer, subset);
[t,sample_order] = sort(src.index./src.sample_rate, 'ascend');
if apply_car
    samples = src.samples(subset, sample_order) - mean(src.samples(2:65,:),1);
else
    samples = src.samples(subset, sample_order);
end
data = ([[subset-1, samples]; ... % Offset by 1 because CREF is channel 1. Prepend one sample indicating which channel
        [0, t]])';                          % Prepend 0 to indicate "time" channel
visualizer.write(data(:), "double");

end