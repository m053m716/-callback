function handleStreamBufferFilledEvent__SendAll(src, evt, visualizer, subset, apply_car, trig_ch)
%HANDLESTREAMBUFFERFILLEDEVENT__SendAll  Callback for FrameFilledEvent from StreamBuffer class (send all streams).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__US(src, evt, visualizer, subset);
[t,sample_order] = sort(src.index./src.sample_rate, 'ascend');
samples = src.samples(:, sample_order);
if apply_car
    vec = subset((subset >= 2) & (subset < 34)); % 2:33 = textile 1
    samples(vec,:) = samples(vec,:) - mean(samples(vec,:),1);
    vec = subset((subset >= 34) & (subset < 66)); % 34:65 = textile 2
    samples(vec,:) = samples(vec,:) - mean(samples(vec,:),1);
end
samples(setdiff(1:size(samples,1), subset), :) = []; % Remove extras.
if strcmpi(src.array, "B")
    data = ([[0, src.samples(trig_ch,sample_order)]; ...% Prepend 0 to indicate triggers channel
             [subset-1, samples]; ... % Offset by 1 because CREF is channel 1. Prepend one sample indicating which channel   
             100, t])';           % Prepend 100 to indicate "time" channel
else % Otherwise, don't give the "send meta" indicator.
    data = ([[0, src.samples(trig_ch,sample_order)]; ...% Prepend 0 to indicate triggers channel
             [subset-1, samples]])'; ... % Offset by 1 because CREF is channel 1. Prepend one sample indicating which channel
end
visualizer.write(data(:), "double");
end