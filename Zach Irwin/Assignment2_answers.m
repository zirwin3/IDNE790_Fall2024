%% Answer guide to Assignment 2
%   Note: there are multiple ways to do most of these, so this is just a
%   guide to one particular way

%% 1) 

x = 1/(2+3^2) + (4/5)*(6/7);
y = x <= 1;
sprintf('1a: y is a %s', class(y))    % y is a logical
y = y + 1;
sprintf('1b: y is a %s', class(y))   % y is a double

%% 2)

str = "Hello World!";
sprintf('2a: str is a %s', class(str))    % str is a String

%% 3)

num = "1001";
sprintf('3a: num is a %s', class(num))    % num is a String
sprintf('3a: num + 1 = %s, so yes you can add 1, sortof...', num+1)

%% 4)

now = datetime();
then = datetime(1988, 9, 5);
diff = now - then;

%% 5)

format long
7/57
format short
dec = 5;

%% 6)

x1 = 100;
x2 = 7;

xtemp = x1;
x1 = x2;
x2 = xtemp;

%% 7)

arr1 = [2.5, 3, 3.5, 4];

%% 8)

arr2 = 7:3:28;
z = arr2(3) + arr2(5) + arr2(7);

%% 9)

arr2_backwards = arr2(end:-1:1);
arr_subset = arr2_backwards(1:2:end);

%% 10)

arr3 = [arr2, arr_subset];

%% 11)

arr4 = arr3';