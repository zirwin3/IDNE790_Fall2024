% ZI: Great job! Grade: 92


%% #1.	Use the “ones()” function to create a matrix with 4 rows and 5 columns named A (use “help ones” if needed)
A= ones(4,5);
%a.	Replace the 2nd row with the numbers 4 through 8
A(2,:)= 4:8;
%b.	Replace the element in the 3rd row, 4th column with -1
A(3,4)=-1;
%c.	Replace the 1st column with the numbers -1 through -4
A(:, 1) = [-1; -2; -3; -4];

        % ZI: Perfect! For the last line, you could also do -1:-1:-4, but
        % this also works

%% 2.	Use the “zeros()” function to create a matrix the same size as A
B= zeros(size(A));
%a.	Replace the sub-matrix consisting of the 3rd-4th rows and 1st-3rd columns of B with the middle sub-matrix of A (i.e. the 2nd and 3rd rows, 2nd-4th columns)
%B = zeros(size(A));
B(3:4, 1:3) = A(2:3, 2:4); 

        % ZI: perfect!

%% 3.	Create a variable C as the sum of A and B
C=A+B;
%a.	Count all the elements of C which are less than zero (use the sum() function)
countLessThanZero = sum(C(:) < 0);
%b.	Replace those elements with zero.
C(C < 0) = 0;

        % ZI: perfect! you could also do sum(C<0, 'all'), which might be
        % slightly more efficient (maybe), but this definitely works

%% 4.	Create a row vector D containing the mean of each column of C (use a single call to the mean() function; hint: there’s a dimension input to the function)
D = mean(C);
%a.	Create another vector D_2 containing the mean of each column of C, but don%t use the mean() function. Hint: the mean is the same as the sum divided by the number of elements
D_2 =sum(C)/4;

    % ZI: perfect! you could also do sum(C)/size(C,1) to avoid hard-coding
    % the size, but this works. I also like to specify the dimension even
    % when you're doing the column default, just for clarity's sake (e.g.
    % mean(C,1) and sum(C,1)) but it's not strictly necessary

%% 5.	Create a column vector E containing the sum of each row of C 
E = sum(C, 2);

%% 6.	Create a row vector F containing the difference between E and the 1st four elements of D (make sure F is not a matrix!)
% Extract the first four elements of D
D4 = D(1:4);

% Ensure E has at least 4 elements
if length(E) >= 4
    % Subtract the first four elements of D from E and transpose
    F = E(1:4) - D4';
else
    error('E must have at least 4 elements.');
end

    % ZI: nice! just remember that row vectors are [1 x N], so you'd need
    % to either transpose F or switch the transpose to E (i.e. F = E(1:4)'
    % - D4)
    
%% 7.	Use the “rand()” function to create a 100-element long vector of random numbers called G.
% Step 1: Create a 100-element vector of random numbers
G = rand(1, 100);

% Step 2: Normalize the vector
G_normalized = G / norm(G);
mean_G = mean(G);
std_G = std(G);

    % ZI: I should have been more clear in the assignment - dividing by the 
    %  vector norm (i.e. norm(G) = sqrt(sum(G.^2))) is one way of
    %  normalizing, but I had meant normalizing in the sense of making the
    %  mean 0 and the standard deviation 1, so I maybe should have said
    %  "standardize" instead. That would be done by subtracting the mean
    %  and dividing by the st. deviation (i.e. G = (G - mean(G))/std(G))
    % 3/4 points


%% 8.	Create a function called “reverse_rows”, which takes in a matrix and outputs the same matrix with the rows reversed.
% function reversed_matrix = reverse_rows(matrix)
    % reverse_rows takes a matrix as input and returns the matrix with its rows reversed.
    % Usage:
    %   reversed_matrix = reverse_rows(matrix)

    % Reverse the order of the rows
    % reversed_matrix = matrix(end:-1:1, :);
% end
%a.	In your script, use the function to create a matrix H which is reverse-row version of C

H = flipud(C);
disp(H);
%b.	Using the same function, create a matrix I which is H with reversed columns (hint: how might you change rows into columns?)
I = fliplr(H);
disp(I);
%change rows into columns
I=H';

            % ZI: the function looks great, but you didn't use it in the
            % script. The intention was for you to use the transpose to
            % flip the matrix, reverse the rows, then transpose it back.
            % i.e. I = reverse_rows(H')'; 1/2 points

%% 9.	Create a matrix J which has a size [5,5] by concatenating the variables x1 = 1:5, x2 = (1:3)., and x3 = ones(3,3). You can use the variables more than once if needed.
% Define the variables
x1 = 1:5;                % Row vector 1x5
x2 = (1:3).';            % Column vector 3x1
x3 = ones(3,3);          % 3x3 matrix of ones

% Create the matrix J
J = [x1;x1; [x2 x2 x3]];       % Concatenate x1 as first row, x2 and x3 below

% Display the resulting matrix
disp(J);

            % ZI: perfect!
