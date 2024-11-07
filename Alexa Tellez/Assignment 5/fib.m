function [nthFib, sumFirst_n] = fib(n)
if n <= 0
    error("Input must be a positive integer.");
end

f1 = 1;
f2 = 1;

if n == 1 || n == 2
    nthFib = 1;
    sumFirst_n = 1;
    return;
end

sumFirst_n = 2;  % calculate the nth number and the sum
for i = 3:n
    nthFib = f1 + f2;
    sumFirst_n = sumFirst_n + nthFib;
    f1 = f2;
    f2 = nthFib;
end
end