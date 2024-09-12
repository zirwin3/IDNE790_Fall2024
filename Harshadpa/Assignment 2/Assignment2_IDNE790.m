%% ZI: Great job! Grade: 100%

% % Assignment #2 – MATLAB as a calculator + variables + arrays – 9/4/2024 – Due: 9/10/2024

% Create a script with the following components

% 1. Compute the following calculation in MATLAB:  x=  1/(2+3^2 )+4/5*6/7

x = 1/(2+3^2) + (4/5)*(6/7);    % ZI: I'd suggest putting parentheses around the
                            %     fractions - (4/5)*(6/7) - just to make the
                            %     order clearer, but you got the right
                            %     answer!

% 1a. Test whether x is less than or equal to 1, and store the result in a variable y

y = x <= 1;

% 1ai.	What data type is y? (if you want, you can use the function “class()” even though we haven’t learned about functions yet!)

class (y)

% The data type of y is 'logical'

% 1b. Add 1 to y and store the result back in y

y = y + 1;

% 1bi. What data type is y now?

class (y);

% The data type of y is now 'double'

% 2. 2.	Create a variable str that contains the phrase “Hello World!” 

str = "Hello World!";

class (str);

% 2a. The data type of str is 'string'

% 3. Create a variable num that contains the phrase “1001” 

num = "1001";

class(num);

% 3a. The data type of num is 'string' (no I cannot add 1 to it directly)

% 4. Create a variable now with today’s date, and a variable then with the date Sept. 5, 1988.

now = datetime('today');            

then = datetime('Sep 5, 1988');

% 4a. Create a variable called diff with the difference in time between now and then.

diff = now - then;

% 5. What is the value of the 10th decimal place of 7 divided by 57

result = 7 / 57;

format long;

% the value of the 10th decimal is 5

format short;

% 5a. Write the lines of code you used to figure it out, and then assign a variable dec to that value

str = num2str(result, 10);

dec = str2double(str(end));        % ZI: this is a great programmatic way
                                   %     to do it! I was thinking of just changing
                                   %      the format to long and manually looking
                                   %      at the 10th place as you did before,
                                   %      but this works!

% 6. Create two variables x1 and x2 that each contains some number (doesn’t matter what)

x1 = 10;

x2 = 20;

% 6a. Write a couple lines of code to switch the values in the two variables (maybe you need a 3rd variable??)

A = x1;

x1 = x2;

x2 = A;


% 7. Manually create an array arr1 containing the numbers from 2.5 to 4 in steps of 0.5

arr1 = [2.5, 3, 3.5, 4];


% 8.	Using the colon operator, create an array arr2 of the integers from 7 to 28 in steps of 3

arr2 = 7:3:28;


% 8a. Create a variable z which is the sum of the 3rd, 5th, and 7th elements of arr2

z = arr2 (3) + arr2 (5) + arr2 (7);     % ZI: just for clarity, I wouldn't
                                        %     put spaces between the
                                        %     variable name and the
                                        %     indexing, but it doesn't hurt
                                        %     anything


% 9. Create an array arr2_backwards which is the same as arr2 but reversed

arr2_backwards = fliplr(arr2);          % ZI: you can also do arr2(end:-1:1)

% 9a. Create a variable arr_subset which is contains every other element of arr2_backwards

arr_subset = arr2_backwards (1:2:end);


% 10. Create an array arr3 which is the concatenation of arr2 and arr_subset

arr3 = [arr2, arr_subset];


% 11. Create an array arr4 which a column (vertical) vector with the same elements as arr3

arr4 = arr3';
