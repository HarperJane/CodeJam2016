jamcoin = [1,0,0,0,1,1];
N = 6;
for base = 2:10
    temp = N-1:-1:0;
    temp = base.^temp;
    temp = sum(temp.*jamcoin);
    
    flag = 0;
    for j = 2:sqrt(temp)
        if rem(temp, j) == 0
            %             stat = strjoin({stat, num2str(j)}, ' ');
            disp(j);
            flag = 1;
            break;
        end;
    end;
    if flag == 0
        disp(strcat('err\t', num2str(base)));
        break;
    end;
end;