function handleStreamBufferFilledEvent__UR(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__UR  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__UR(src, evt, visualizer);
%
% UR: Unipolar raster plot.

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");

disp("Unipolar raster handling not configured.");

end