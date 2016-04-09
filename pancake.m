% CodeJam Problem 2: pancake
% Problem:
%{
Problem

The Infinite House of Pancakes has just introduced a new kind of pancake! It has a happy face made of chocolate chips on one side (the "happy side"), and nothing on the other side (the "blank side").

You are the head waiter on duty, and the kitchen has just given you a stack of pancakes to serve to a customer. Like any good pancake server, you have X-ray pancake vision, and you can see whether each pancake in the stack has the happy side up or the blank side up. You think the customer will be happiest if every pancake is happy side up when you serve them.

You know the following maneuver: carefully lift up some number of pancakes (possibly all of them) from the top of the stack, flip that entire group over, and then put the group back down on top of any pancakes that you did not lift up. When flipping a group of pancakes, you flip the entire group in one motion; you do not individually flip each pancake. Formally: if we number the pancakes 1, 2, ..., N from top to bottom, you choose the top i pancakes to flip. Then, after the flip, the stack is i, i-1, ..., 2, 1, i+1, i+2, ..., N. Pancakes 1, 2, ..., i now have the opposite side up, whereas pancakes i+1, i+2, ..., N have the same side up that they had up before.

For example, let's denote the happy side as + and the blank side as -. Suppose that the stack, starting from the top, is --+-. One valid way to execute the maneuver would be to pick up the top three, flip the entire group, and put them back down on the remaining fourth pancake (which would stay where it is and remain unchanged). The new state of the stack would then be -++-. The other valid ways would be to pick up and flip the top one, the top two, or all four. It would not be valid to choose and flip the middle two or the bottom one, for example; you can only take some number off the top.

You will not serve the customer until every pancake is happy side up, but you don't want the pancakes to get cold, so you have to act fast! What is the smallest number of times you will need to execute the maneuver to get all the pancakes happy side up, if you make optimal choices?

Input

The first line of the input gives the number of test cases, T. T test cases follow. Each consists of one line with a string S, each character of which is either + (which represents a pancake that is initially happy side up) or - (which represents a pancake that is initially blank side up). The string, when read left to right, represents the stack when viewed from top to bottom.

Output

For each test case, output one line containing Case #x: y, where x is the test case number (starting from 1) and y is the minimum number of times you will need to execute the maneuver to get all the pancakes happy side up.

Limits

1 ? T ? 100.
Every character in S is either + or -.

Small dataset

1 ? length of S ? 10.
Large dataset

1 ? length of S ? 100.
%}

T = input('');
count_T = 0;
while count_T<T
    count_T = count_T + 1;
    
    cake_stat = input('','s');
    cake_stat = (cake_stat+0-43)/2;
    
    stat = strcat('Case #', num2str(count_T),':');
    count_flip = 0;
    while true
        if sum(cake_stat) == 0
            stat = strjoin({stat, num2str(count_flip)}, ' ');
            disp(stat);
            break;
        end;
        
        count_flip = count_flip+1;
        p = find(cake_stat ~= cake_stat(1), 1);
        if isempty(p)
            p = length(cake_stat);
        else
            p = p - 1;
        end;
        cake_stat(1:p) = 1-cake_stat(1:p);
    end;
end;
        
        