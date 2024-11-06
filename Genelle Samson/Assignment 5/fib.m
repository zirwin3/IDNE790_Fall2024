% Fibonacci sequence function
% Input n returns the nth element of the Fibonacci sequence, where each entry is the sum of the preceding two
% entries (e.g., 1, 1, 2, 3, 5, 8, 13, ...). Input n must be a positive integer.
% Second output returns the sum of the first to nth elements.
% 
% Example: [x, y] = fib(3) will yield x = 2 and y = 4.

function [fibelem, fibsum] = fib(n)
   
    fib_seq = [1, 1];

    for i = 3:n
        fib_seq(i) = fib_seq(i-1) + fib_seq(i-2);
    end

    fibelem = fib_seq(n);
    fibsum = sum(fib_seq);

end