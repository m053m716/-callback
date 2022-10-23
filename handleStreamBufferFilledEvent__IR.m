function handleStreamBufferFilledEvent__IR(src, evt, visualizer)
%HANDLESTREAMBUFFERFILLEDEVENT__IR  Callback for FrameFilledEvent from StreamBuffer class.
%
% Syntax:
%   callback.handleStreamBufferFilledEvent__IR(src, evt, visualizer);

% [~, idx] = sort(src.index, 'ascend');
% data = src.samples(:, idx)';
% visualizer.write(data(:), "double");

disp("ICA raster handling not configured.");

end