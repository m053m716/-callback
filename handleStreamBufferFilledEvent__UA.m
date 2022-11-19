function handleStreamBufferFilledEvent__UA(src, evt, visualizer, selected_channel, apply_car, trig_ch)
%HANDLESTREAMBUFFERFILLEDEVENT__UA  Callback for FrameFilledEvent from StreamBuffer class (Unipolar Averaging).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__UA(src, evt, visualizer, selected_channel);
[~,sample_order] = sort(src.index, 'ascend');
if apply_car
    samples = src.samples(selected_channel, sample_order) - mean(src.samples(2:65,:),1);
else
    samples = src.samples(selected_channel, sample_order);
end
data = ([[0, src.samples(trig_ch, sample_order)]; ... % Prepend 0 indicating triggers
         [1, samples]])';                             % Prepend 1 indicating data
visualizer.write(data(:), "double");

end