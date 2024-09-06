
% Problem 1
x = ((1/(2+3^2))+((4/5)*(6/7)));

y = (x<=1); %% Variable y is data type 'logical'
y = y + 1; %% Variable y is data type 'double'

% Problem 2
str = "Hello World!"; % Variable str is data type 'string'

% Problem 3
num = "1001"; % Variable num is data type string. Technically, you can add a 1 to it, to make the string "10011"

% Problem 4
now = datetime(2024,9,5);

then = datetime(1988,9,5); 

diff = now-then;

% Problem 5 %% This feels like a ridiculous way to solve this problem, but it's what makes sense to me. 
format long
a = 7/57;
astr = num2str(a,10);
achar = char(astr);
dec = achar(end);

% Problem 6
x1 = 51;
x2 = 67;

x3 = x2;
x2 = x1;
x1 = x3; 

% Problem 7
arr1 = [2.5 3.0 3.5 4.0];

% Problem 8
arr2 = 7:3:28;

z = arr2(3) + arr2(5) + arr2(7);

% Problem 9
arr2_backwards = 28:-3:7;
arr_subset = arr2_backwards(1:2:end);

% Problem 10
arr3 = [arr2 arr_subset];

% Problem 11
arr4 = arr3';