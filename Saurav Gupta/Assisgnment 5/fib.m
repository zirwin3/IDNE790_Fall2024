function [nth_fib, sum_fib] = fib(n)
    if n == 0 || n == 1
        nth_fib = n;
        sum_fib = n;
    else
        [prev_fib, prev_sum] = fib(n-1);
        [curr_fib, curr_sum] = fib(n-2);
        nth_fib = prev_fib + curr_fib;
        sum_fib = nth_fib + prev_sum;
    end
end