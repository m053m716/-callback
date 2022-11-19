function handleStreamBufferFilledEvent__BA(src, evt, visualizer, selected_channel, trig_ch)
%HANDLESTREAMBUFFERFILLEDEVENT__BA  Callback for FrameFilledEvent from StreamBuffer class (Bipolar Averaging).
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__BA(src, evt, visualizer);
[~,sample_order] = sort(src.index./src.sample_rate, 'ascend');
samples = src.samples(selected_channel, sample_order);
data = ([[0, src.samples(trig_ch, sample_order)]; ... % Prepend 0 indicating triggers
         [1, samples]])';                             % Prepend 1 indicating data
visualizer.write(data(:), "double");

end