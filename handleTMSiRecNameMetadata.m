function handleTMSiRecNameMetadata(client, SUBJ, YYYY, MM, DD, BLOCK)
%HANDLETMSIRECNAMEMETADATA  Set recording name metadata using consistent convention.
%
% Example:
% >> callback.handleTMSiRecNameMetadata(client, "Mats", 2022, 10, 20, 3);



if isnumeric(BLOCK)
    BLOCK = string(BLOCK);    
end
id_expr = sprintf('set.block.%s', BLOCK); 
writeline(client, id_expr);

if isnumeric(YYYY)
    YYYY = string(sprintf('%04d', YYYY));
end
if isnumeric(MM)
    MM = string(sprintf('%02d', MM));
end
if isnumeric(DD)
    DD = string(sprintf('%02d', DD)); 
end
tank = sprintf('%s_%s_%s_%s', SUBJ, YYYY, MM, DD);
tank_expr = sprintf('set.tank.%s', tank);
writeline(client, tank_expr);

fname = sprintf('%s_%%s_%s', tank, BLOCK);
file_expr = sprintf('set.file.%s', fullfile(SUBJ, tank, fname));
writeline(client, file_expr);
end