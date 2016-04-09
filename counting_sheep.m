% Code Jam - Problem 1
% Problem
%{
Bleatrix Trotter the sheep has devised a strategy that helps her fall asleep faster. First, she picks a number N. Then she starts naming N, 2 ? N, 3 ? N, and so on. Whenever she names a number, she thinks about all of the digits in that number. She keeps track of which digits (0, 1, 2, 3, 4, 5, 6, 7, 8, and 9) she has seen at least once so far as part of any number she has named. Once she has seen each of the ten digits at least once, she will fall asleep.

Bleatrix must start with N and must always name (i + 1) ? N directly after i ? N. For example, suppose that Bleatrix picks N = 1692. She would count as follows:

N = 1692. Now she has seen the digits 1, 2, 6, and 9.
2N = 3384. Now she has seen the digits 1, 2, 3, 4, 6, 8, and 9.
3N = 5076. Now she has seen all ten digits, and falls asleep.
What is the last number that she will name before falling asleep? If she will count forever, print INSOMNIA instead.

Input

The first line of the input gives the number of test cases, T. T test cases follow. Each consists of one line with a single integer N, the number Bleatrix has chosen.

Output

For each test case, output one line containing Case #x: y, where x is the test case number (starting from 1) and y is the last number that Bleatrix will name before falling asleep, according to the rules described in the statement.

Limits

1 ? T ? 100.
Small dataset

0 ? N ? 200.
Large dataset

0 ? N ? 106.
%}

T = input('');
count_T = 0;
while count_T < T
    count_T = count_T + 1;
    N = input('');
    
    if N == 0
        disp(strcat('Case #', num2str(count_T), ': INSOMNIA'));
        continue;
    else
        stat = strcat('Case #', num2str(count_T), ':');
    end;
    
    flag = zeros(10,1); % flag for 0, 1, ..., 9
    multiplier = 0;
    while true
        multiplier = multiplier + 1;
        nn = N * multiplier;
        s = num2str(nn);
        s = s+0-47;
        flag(s) = flag(s) + 1;
        if min(flag) > 0
            stat = strjoin({stat, num2str(nn)}, ' ');
            disp(stat);
            break;
        end;
    end;
end;
            
            
            