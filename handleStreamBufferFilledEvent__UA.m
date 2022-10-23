function handleStreamBufferFilledEvent__UA(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__UA  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__UA(src, evt, visualizer);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");

disp("Unipolar average handling not configured.");

end