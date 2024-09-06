x = (1/(2+(3^2)))+(4/5)*(6/7)
% ans is 0.7766
y = (x<1)
class(y)
% 1.a.i.: y is a logical
y = y + 1
% 1.b.i.: y is now a double

str = "Hello World!"
class(str)
% 2.a.: str is a string 

num = 1001
% 3.a.: num is a double (numerical)-- you can add 1 to it

now = datetime
then = datetime(1988, 9, 5)
diff = now - then

format long
7/57
dec = 5

x1 = 1
x2 = 2
x3 = x1
x1 = x2
x2 = x3

arr1 = [2.5, 3, 3.5, 4]

arr2 = [7:3:28]
z = arr2(3) + arr2(5) + arr2(7)

arr2backwards = [28:-3:7]
arr_subset = [25:-6:7]

arr3 = [arr2, arr_subset]

arr4 = arr3'