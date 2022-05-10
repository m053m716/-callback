function deleteTaggedElement(src, tag)
%DELETETAGGEDELEMENT  Delete any child object with the tag `tag` from all child axes.
%
% Example:
%   h1 = plot(ax1, data, 'Tag', 'data');
%   h2 = plot(ax2, data, 'Tag', 'data');
%   set(h1, 'ButtonDownFcn', @(src, ~)cb.deleteTaggedElement(src.Parent.Parent, 'data'));
%
% This would delete both `h1` and `h2` if `h1` is clicked.

ax = findobj(src.Children, 'Type', 'axes');
for iAx = 1:numel(ax)
    h = findobj(ax(iAx).Children, 'Tag', tag);
    delete(h);
end
end