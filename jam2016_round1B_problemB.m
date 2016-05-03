clc;
clear;
close all;

T       = input('');
count_T = 0;
fid     = fopen('problem_b.txt', 'w');

while count_T < T
    count_T = count_T + 1;
    stat    = strcat('Case #', num2str(count_T), ':');
    
    S   = input('', 's');
    S2  = strsplit(S, ' ');
    C   = S2{1};
    J   = S2{2};
    
    [c, j] = findCloseMatch(C, J, 1);
    stat = strjoin({stat, c, j}, ' ');
    disp(stat);
    fprintf(fid, stat);
    fprintf(fid, '\n');
end;
fclose(fid);   
        
    
    