% CodeJam Problem C
% Problem
%{
Problem

A jamcoin is a string of N ? 2 digits with the following properties:

Every digit is either 0 or 1.
The first digit is 1 and the last digit is 1.
If you interpret the string in any base between 2 and 10, inclusive, the resulting number is not prime.
Not every string of 0s and 1s is a jamcoin. For example, 101 is not a jamcoin; its interpretation in base 2 is 5, which is prime. But the string 1001 is a jamcoin: in bases 2 through 10, its interpretation is 9, 28, 65, 126, 217, 344, 513, 730, and 1001, respectively, and none of those is prime.

We hear that there may be communities that use jamcoins as a form of currency. When sending someone a jamcoin, it is polite to prove that the jamcoin is legitimate by including a nontrivial divisor of that jamcoin's interpretation in each base from 2 to 10. (A nontrivial divisor for a positive integer K is some positive integer other than 1 or K that evenly divides K.) For convenience, these divisors must be expressed in base 10.

For example, for the jamcoin 1001 mentioned above, a possible set of nontrivial divisors for the base 2 through 10 interpretations of the jamcoin would be: 3, 7, 5, 6, 31, 8, 27, 5, and 77, respectively.

Can you produce J different jamcoins of length N, along with proof that they are legitimate?

Input

The first line of the input gives the number of test cases, T. T test cases follow; each consists of one line with two integers N and J.

Output

For each test case, output J+1 lines. The first line must consist of only Case #x:, where x is the test case number (starting from 1). Each of the last J lines must consist of a jamcoin of length N followed by nine integers. The i-th of those nine integers (counting starting from 1) must be a nontrivial divisor of the jamcoin when the jamcoin is interpreted in base i+1.

All of these jamcoins must be different. You cannot submit the same jamcoin in two different lines, even if you use a different set of divisors each time.

Limits

T = 1. (There will be only one test case.)
It is guaranteed that at least J distinct jamcoins of length N exist.

Small dataset

N = 16.
J = 50.
Large dataset

N = 32.
J = 500.
Note that, unusually for a Code Jam problem, you already know the exact contents of each input file. For example, the Small dataset's input file will always be exactly these two lines:

1
16 50
So, you can consider doing some computation before actually downloading an input file and starting the clock.

%}

clc;
clear;

T = input('');
count_T = 0;


while count_T < T
    count_T = count_T + 1;
    
    text_in = input('', 's');
    text_in = str2num(text_in);
    N = text_in(1);
    J = text_in(2);
    
    stat = strcat('Case #', num2str(count_T),':');
    disp(stat);
    
    count_J = 0;
    
    numer = 0:2^(N-2)-1;
    numer_len = length(numer);
    numer_pos = 0;
    jamcoin = zeros(1,N);
    jamcoin(1) = 1;
    jamcoin(N) = 1;
    while count_J < J
        if numer_pos >= numer_len
            disp('err');
            break;
        end;
        while numer_pos < numer_len
            numer_pos = numer_pos + 1;
            num = dec2bin(numer(numer_pos), N-2);
            stat = strcat('1', num, '1');
            
            num = num + 0 - 48;
            jamcoin(2:N-1) = num;
            
            % check
            for base = 2:10
                temp = N-1:-1:0;
                temp = base.^temp;
                temp = sum(temp.*jamcoin);
                
                flag = 0;
                for j = 2:sqrt(temp)
                    if rem(temp, j) == 0
                        stat = strjoin({stat, num2str(j)}, ' ');
                        flag = 1;
                        break;
                    end;
                end;
                if flag == 0
                    break;
                end;
            end;
            if flag == 1
                break;
            end;
        end;
        if flag == 1
            count_J = count_J + 1;
            disp(stat);
        end;
    end;
end;
            
        
        
        
        
        