%% ZI: Great job! Grade: 100%

x=((1)/(2+3^2)+(4/5)*(6/7));        % ZI: you don't necessarily need parentheses
                                     %      around single numbers, but they
                                     %      don't hurt and I like the clarity!
x<=1;
y = x <= 1; % y is the logical variable
y = y + 1;   %y is a numeric data type
%% #2
str = 'Hello World!'; %str is a character array (string)    

                    % ZI: technically, char arrays and Strings are
                    % different data types, but we haven't gotten there yet
                    % so yes!
                                
%% #3
num = "1001"; %num is a character array (string). 1 cannot be added to num because it is a string

                    % ZI: technically, char arrays and Strings are
                    % different data types, but we haven't gotten there yet
                    % so yes!

%% #4
now = datetime('today');         % Today's date

then = datetime(1988, 9, 5);     % Date: September 5, 1988
diff = now - then;
%% #5 
% Step 1: Perform the division
result = 7 / 57;

% Step 2: Shift the 10th decimal place to the left
shiftedNumber = result * 10^10;

% Step 3: Extract the 10th decimal place
tenthDecimalPlace = floor(mod(shiftedNumber, 10));

% Step 4: Assign the value to the variable dec
dec = tenthDecimalPlace;

                            % ZI: I like this method! I was thinking of just changing
                             %      the format to long and manually looking
                             %      at the 10th place, but this is an
                             %      excellent programmatic way of doing it.


%% #6
% Initialize the variables
x1 = 5;
x2 = 10;
% Use a temporary variable to swap the values
temp = x1; % Store the value of x1 in temp
x1 = x2;   % Assign the value of x2 to x1
x2 = temp; % Assign the value of temp (original x1) to x2
%% #7
arr1 = 2.5:0.5:4;       % ZI: By "manually", I was thinking of hard-coding 
                        %     the numbers, like arr1 = [2.5, 3, 3.5, 4],
                        %     but I didn't specify that, so yes!

%% 8.	Using the colon operator, create an array arr2 of the integers from 7 to 28 in steps of 3
%Create a variable z which is the sum of the 3rd, 5th, and 7th elements of arr2

arr2 = 7:3:28;
z = sum (arr2([3, 5, 7]));
%% 9.	Create an array arr2_backwards which is the same as arr2 but reversed
% Create a variable arr_subset which is contains every other element of arr2_backwards

% Step 1: Reverse arr2 to create arr2_backwards
arr2_backwards = arr2(end:-1:1);

% Step 2: Create arr_subset by selecting every other element from arr2_backwards
arr_subset = arr2_backwards(1:2:end);
%% 10.	Create an array arr3 which is the concatenation of arr2 and arr_subset

arr3 = [arr2,arr_subset];
%% 11.	Create an array arr4 which a column (vertical) vector with the same elements as arr3

arr4 = [arr3'];     % ZI: you don't necessarily need the brackets when just
                    %     doing the transpose, but it doesn't hurt!

