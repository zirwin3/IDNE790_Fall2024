
% Assignment #3 – Arrays and matrices + scripts and functions – 9/13/2024 – Due: 9/19/2024

% * Note1: bolded items are variables that should be present in the MATLAB workspace after running the script
% * Note2: for components that have a question associated with them, create a comment containing your answer after the
% line(s) of code that got the answer (for example, x = 7^2 + 2; # the data type is ‘double’)

%% Create a script with the following components*

% 1. Use the “ones()” function to create a matrix with 4 rows and 5 columns named A (use “help ones” if needed)

A = ones(4, 5);

% a. Replace the 2nd row with the numbers 4 through 8

A(2, :) = 4:8;

% b. Replace the element in the 3rd row, 4th column with -1

A(3, 4) = -1;

% c. Replace the 1st column with the numbers -1 through -4

A(:, 1) = (-1:-1:-4)';

%% 2.	Use the “zeros()” function to create a matrix B which has the same size as A

B = zeros(4, 5);

% or

B = zeros(size(A));

% a.	Replace the sub-matrix consisting of the 3rd-4th rows and 1st-3rd columns of B with the middle sub-matrix of A (i.e. the 2nd and 3rd rows, 2nd-4th columns

B(3:4, 1:3) = A(2:3, 2:4);

%% 3. Create a variable C as the sum of A and B

C = A + B;

% a. Count all the elements of C which are less than zero (use the sum() function)

num_elements_negative = sum(C(:) < 0);

% b. Replace those elements with zero.

C(C < 0) = 0;


%% 4. Create a row vector D containing the mean of each column of C (use a single call to the mean() function; hint:
% there’s a dimension input to the function)

D = mean (C);

% a. Create another vector D_2 containing the mean of each column of C, but don’t use the mean() function.
% Hint: the mean is the same as the sum divided by the number of elements

D_2 = sum(C) / size(C, 1);


%% 5. Create a column vector E containing the sum of each row of C

E = sum(C, 2);


%% 6. Create a row vector F containing the difference between E and the 1st four elements of D (make sure F is not a
% matrix!)

F = E - D (1:4);

%% 6. Create row vector F as difference between E and first four elements of D

F = E' - D(1:4);


%% 7. Use the “rand()” function to create a 100-element long vector of random numbers called G.


G = rand(1, 100);

% a. Normalize G (e.g. make the mean of G 0 and the standard deviation G 1). You can use the mean() and
% std() functions

G = (G - mean(G)) / std(G);


%% 8. Create a function called “reverse_rows”, which takes in a matrix and outputs the same matrix with the rows
% reversed.

function output = reverse_rows(input_matrix)
    output = input_matrix(end:-1:1, :);
end


% a. In your script, use the function to create a matrix H which is reverse-row version of C

H = reverse_rows(C);

% b. Using the same function, create a matrix I which is H with reversed columns (hint: how might you change
% rows into columns?)

I = reverse_rows(H')';


%% 9. Create a matrix J which has a size [5,5] by concatenating the variables x1 = 1:5, x2 = (1:3)’, and x3 = ones(3,3).
% You can use the variables more than once if needed.

% 9. Create matrix J with size [5,5] using concatenation
x1 = 1:5;
x2 = (1:3)';
x3 = ones(3,3);

J = [x1; [x2, x3]; x1];

































