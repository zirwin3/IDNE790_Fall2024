%% ZI: Great job! The only thing I'd suggest is to put comments separating 
%      the questions, but that's just formatting and we haven't introduced
%      it in class yet.  Grade: 100%

x = (1/(2+(3^2)))+(4/5)*(6/7)         % ZI: excellent use of parentheses!
% ans is 0.7766
y = (x<1)                             % ZI: you don't technically need the 
                                      %     parenthes here, but it doesn't
                                      %     hurt!
class(y)
% 1.a.i.: y is a logical
y = y + 1
% 1.b.i.: y is now a double

str = "Hello World!"
class(str)
% 2.a.: str is a string 

num = 1001
% 3.a.: num is a double (numerical)-- you can add 1 to it
                            
                                % ZI: I actually meant to create num as a
                                % string (i.e. num = "1001"), but it wasn't
                                % clear so yes!

now = datetime                  % ZI: You can do datetime('today') to just get
                                %     the date without the time, but this
                                %     works too!
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

arr2 = [7:3:28]                     % ZI: you don't need the brackets when 
                                    %     using the colon operator, but
                                    %     they don't hurt!
z = arr2(3) + arr2(5) + arr2(7)

arr2backwards = [28:-3:7]           % ZI: you can also do arr2(end:-1:1)
arr_subset = [25:-6:7]              % ZI: you can also do arr2backwards(1:2:end)
                                    %       -- or in this case arr2backwards(2:2:end)

arr3 = [arr2, arr_subset]

arr4 = arr3'