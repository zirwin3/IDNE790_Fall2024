function [c, b] = fib(n)

a = zeros(1, n);
a(1) = 1;
a(2) = 1;

for i = 3:n
    a(i) = a(i-1) + a(i-2);
end

c = a(n)

b = sum(a)
