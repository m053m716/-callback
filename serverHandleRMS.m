function serverHandleRMS(src, evt)
%SERVERHANDLERMS  Read data callback for online VIEWER server in RMS contour mode.
%
% Syntax:
%   configureCallback(viewerServer, "byte", n, @(src,evt)callback.serverHandleRMS(src,evt));
%
% See also: Contents, deploy__tmsi_tcp_servers

n_data = src.UserData.n.samples * src.UserData.n.channels;
src.UserData.data = reshape(read(src, n_data, "double"), ...
    src.UserData.n.samples, src.UserData.n.channels);
src.UserData.lab.String = sprintf(src.UserData.lab_expr, ...
    string(evt.AbsoluteTime));
sync_word = sum(2.^src.UserData.sync.bit);
sync_data = ~(bitand(src.UserData.data(:, src.UserData.sync.ch), sync_word) == sync_word);
if sum(sync_data) == 0
    return;
end
t_stim = find([false; diff(sync_data) > 0]);
for iStim = 1:numel(t_stim)
    onset = t_stim(iStim);
    if (onset + src.UserData.rms.epoch(2) - 1) > size(src.UserData.data, 1)
        return;
    end
    e = src.UserData.rms.epoch + onset - 1;
    x = src.UserData.data(e(1):e(2), src.UserData.channels.UNI);
    x = x - mean(x, 2);
    q = sqrt(sum(((x - mean(x, 1)).^2), 1)./(e(2) - e(1))); % RMS
    % q = q + 0.1*randn(size(q)); % For visualizing changes/testing
    src.UserData.rms.uni(:, :, src.UserData.rms.index) = reshape(q, 8, 8);
    mu = mean(src.UserData.rms.uni, 3);
    set(src.UserData.uni, 'ZData', mu);
    
    y = src.UserData.data(e(1):e(2), src.UserData.channels.BIP) - mean(src.UserData.data(e(1):e(2), src.UserData.channels.BIP), 1);
    src.UserData.ts.bip(:, :, src.UserData.rms.index) = (y - median(y, 2))';
    for ii = 1:numel(src.UserData.multi_line)
        src.UserData.multi_line(ii).YData = mean(src.UserData.ts.bip(ii, :, :), 3);
    end
    src.UserData.rms.bip(:, :, src.UserData.rms.index) = (sqrt(sum(y.^2, 1)./(e(2) - e(1))))';
    set(src.UserData.bip, 'CData', src.UserData.rms.bip(:, :, src.UserData.rms.index));
    
    drawnow limitrate;
    src.UserData.rms.index = rem(src.UserData.rms.index, src.UserData.rms.index_max) + 1;
end



end