function [fib_n, sum_fib] = fib(n)

if (n < 1)
    error('n should be > 0');
end

% if (n == 1 || n ==2)
%     fib_n = 1;
%     sum_fib = 1;
%     return;
% % elseif (n == 2)
% %     fib_n = 1;
% %     sum_fib = 2;
% %     return;
% end
 
fib = [1, 1, zeros(1, n-2)];
for i = 3:n
    fib(i) = fib(i - 1) + fib(i - 2);
end

fib_n = fib(end);
sum_fib = sum(fib);

end