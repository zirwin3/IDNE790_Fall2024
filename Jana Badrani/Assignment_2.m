%Question 1

x = (1/(2+(3^2))) + ((4/5)*(6/7))

%Question 1a

y = x<=1

class(y) %y is a logical data type.

%Question 1b

y = y + 1

class(y) %y is a double data type.

%Question 2

str = "Hello World!"

class(str) %str is a string data type.

%Question 3

num = "1001"

class(num) %num is a string data type.

num + 1 %Attempting to add one to num does not increase the value of num to 1002 but adds an additional one to the end of the value

%Question 4

now = today("datetime")

then = datetime(1988,09,05)

diff = now - then

%Question 5

format long
Q5 = (7/57)
Q5_round = round(Q5,10)

dec = 5

%Question 6

x1 = 5
x2 = 7

x3 = x1
x1 = x2
x2 = x3

%Question 7

format short
arr1 = [2.5 3.0 3.5 4.0]

%Question 8

arr2 = [7:3:28]

z = arr2(3) + arr2(5) + arr2(7)

%Question 9

arr2_backwards = [28:-3:7]

arr_subset = arr2_backwards(1:2:end)

%Question 10

arr3 = [arr2, arr_subset]

%Question 11

arr4 = transpose(arr3)

































