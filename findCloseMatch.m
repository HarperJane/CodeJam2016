% code jam 2016 round1b close match

function [c, j] = findCloseMatch(c0, j0, position)
len = length(c0);
c   = c0;
j   = j0;

if position > len
    return;
end;

isCaQM = (c(position) == '?');
isJaQM = (j(position) == '?');

if ~isCaQM && ~isJaQM
    if c(position) > j(position)
        c = strrep(c, '?', '0');
        j = strrep(j, '?', '9');
        return;
    end;
    
    if c(position) < j(position)
        c = strrep(c, '?', '9');
        j = strrep(j, '?', '0');
        return;
    end;
    
    if c(position) == j(position)
        position = position + 1;
        [c,j] = findCloseMatch(c, j, position);
        return;
    end;
end;

if ~isCaQM && isJaQM
    c_val           = zeros(1,3);
    j_val           = zeros(1,3);
    % try c > j
    if c(position) > '0'
        c1 = c;
        j1 = j;
        j1(position) = char(c(position) - 1);
        c1 = strrep(c1, '?', '0');
        j1 = strrep(j1, '?', '9');
    else
        c1 = c;
        j1 = j;
        c1 = strrep(c1, '?', '0');
        j1 = strrep(j1, '?', '0');
    end;
    c_val(1) = str2num(c1);
    j_val(1) = str2num(j1);
    
    % try c < j
    if c(position) < '9'
        c2 = c;
        j2 = j;
        j2(position) = char(c(position) + 1);
        c2 = strrep(c2, '?', '9');
        j2 = strrep(j2, '?', '0');
    else
        c2 = c;
        j2 = j;
        c2 = strrep(c2, '?', '0');
        j2 = strrep(j2, '?', '0');
    end;
    c_val(2) = str2num(c2);
    j_val(2) = str2num(j2);
    
    % try c == j
    c3 = c;
    j3 = j;
    j3(position) = c3(position);
    [c3, j3] = findCloseMatch(c3,j3,position+1);
    
    c_val(3) = str2num(c3);
    j_val(3) = str2num(j3);
    
    abs_c_minus_j   = abs(c_val - j_val);
    min_val         = min(abs_c_minus_j);
    min_val_index   = find(abs_c_minus_j == min_val);
    if length(min_val_index) > 1
        temp = find(c_val(min_val_index) == min(c_val(min_val_index)));
        min_val_index = min_val_index(temp);
        temp = find(j_val(min_val_index) == min(j_val(min_val_index)));
        min_val_index = min_val_index(temp);
        min_val_index = min_val_index(1);
    end;
    c = eval(strcat('c', num2str(min_val_index)));
    j = eval(strcat('j', num2str(min_val_index)));
    return;
end;

if isCaQM && ~isJaQM
    c_val           = zeros(1,3);
    j_val           = zeros(1,3);
    % try j > c
    if j(position) > '0'
        c1 = c;
        j1 = j;
        c1(position) = char(j(position) - 1);
        c1 = strrep(c1, '?', '9');
        j1 = strrep(j1, '?', '0');
    else
        c1 = c;
        j1 = j;
        c1 = strrep(c1, '?', '0');
        j1 = strrep(j1, '?', '0');
    end;
    c_val(1) = str2num(c1);
    j_val(1) = str2num(j1);
    
    % try j < c
    if j(position) < '9'
        c2 = c;
        j2 = j;
        c2(position) = char(j(position) + 1);
        c2 = strrep(c2, '?', '0');
        j2 = strrep(j2, '?', '9');
    else
        c2 = c;
        j2 = j;
        c2 = strrep(c2, '?', '0');
        j2 = strrep(j2, '?', '0');
    end;
    c_val(2) = str2num(c2);
    j_val(2) = str2num(j2);
    
    % try c == j
    c3 = c;
    j3 = j;
    c3(position) = j3(position);
    [c3, j3] = findCloseMatch(c3,j3,position+1);
    c_val(3) = str2num(c3);
    j_val(3) = str2num(j3);
    
    abs_c_minus_j   = abs(c_val - j_val);
    min_val         = min(abs_c_minus_j);
    min_val_index   = find(abs_c_minus_j == min_val);
    if length(min_val_index) > 1
        temp = find(c_val(min_val_index) == min(c_val(min_val_index)));
        min_val_index = min_val_index(temp);
        temp = find(j_val(min_val_index) == min(j_val(min_val_index)));
        min_val_index = min_val_index(temp);
        min_val_index = min_val_index(1);
    end;
    c = eval(strcat('c', num2str(min_val_index)));
    j = eval(strcat('j', num2str(min_val_index)));
    return;
end;
    
if isCaQM && isJaQM
    c_val = zeros(1,3);
    j_val = zeros(1,3);
    
    % try c < j
    c1 = c;
    j1 = j;
    c1(position) = '0';
    j1(position) = '1';
    c1 = strrep(c1, '?', '9');
    j1 = strrep(j1, '?', '0');
    c_val(1) = str2num(c1);
    j_val(1) = str2num(j1);
    
    % try c > j
    c2 = c;
    j2 = j;
    c2(position) = '1';
    j2(position) = '0';
    c2 = strrep(c2, '?', '0');
    j2 = strrep(j2, '?', '9');
    c_val(2) = str2num(c2);
    j_val(2) = str2num(j2);
    
    % try c = j
    c3 = c;
    j3 = j;
    c3(position) = '0';
    j3(position) = '0';
    [c3, j3] = findCloseMatch(c3, j3, position+1);
    c_val(3) = str2num(c3);
    j_val(3) = str2num(j3);
    
    abs_c_minus_j   = abs(c_val - j_val);
    min_val         = min(abs_c_minus_j);
    min_val_index   = find(abs_c_minus_j == min_val);
    if length(min_val_index) > 1
        temp = find(c_val(min_val_index) == min(c_val(min_val_index)));
        min_val_index = min_val_index(temp);
        temp = find(j_val(min_val_index) == min(j_val(min_val_index)));
        min_val_index = min_val_index(temp);
        min_val_index = min_val_index(1);
    end;
    c = eval(strcat('c', num2str(min_val_index)));
    j = eval(strcat('j', num2str(min_val_index)));
    return;
end;
    