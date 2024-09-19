%Notes on Vectorization
x = 100:110;
% compute y = x^2
y = zeros(1:length(x));
for i = 1:length(x)
    y(i) = x(i)^2;
end 

%% or, sum that all up as... 
y = x.^2;

%% or...
y = x.*x;

%%
t = (0:.05:10);
x = sin(2*pi*2*t);
plot(t,x);
hold on;
plot(t,x.^2);