function [fib_n, sum_fib] = fib(n)
    % Check that the input is greater than 0
    if n <= 0
        error('Input must be a positive integer.');
    end

    % Initialize the first two Fibonacci numbers
    fib_sequence = [1, 1];

    % Compute the Fibonacci sequence up to the nth element
    for i = 3:n
        fib_sequence(i) = fib_sequence(i-1) + fib_sequence(i-2);
    end

    % The nth Fibonacci number
    fib_n = fib_sequence(n);

    % Sum of the first n Fibonacci numbers
    sum_fib = sum(fib_sequence);
end