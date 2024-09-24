%% ZI: Great job! Just make sure to run each line after you write it to check the output - you'll
%		catch a lot of typos and errors that way! Grade: 85%

% assignment 3
%% #1
A = ones(4,5)  % make a 4x5 matrix of ones
A(2,:) = 4:8   % replace the 2nd row with numbers 4-8
A(3,4) = -1    % replace the element in the 3rd row, 4th column with -1
A(:,1) = (-4:-1) % replace the 1st column with numbers -1 through -4
                        % ZI: great! I had intended the last operation to
                        % be reversed (-1:-1:-4), but I didn't specify so
                        % this works!
                      

%% #2
B = zeros(size(A)) % create a matrix of zeros the same size as A
B(3:4,1:3) = A(2:3,2:4) % replace the third and fourth rows of B with the 2nd and 3rd rows of A

            % ZI: great!
        
%% #3
C = A + B % sum of matrices A and B
lessthanzero = sum(C(:) < 0) % counts elements less than zero in C
C(C < 0) = 0 % replace elements in C less than zero with zero

            % ZI: great! you can also do sum(C<0, 'all'), which might be
            % slightly(?) more efficient, but this works also

%% #4
D = mean(C, 1) % mean of each column of C
D_2 = (sum(C,1)) / (size(C,1)) % the mean of each column of C without using mean()

            % ZI: great! you don't necessarily need parentheses around
            % functions, since those always take highest priority, but it
            % doesn't hurt anything
        

%% #5
E = sum(C,2) % sum of each row of C

            % ZI: great!

%% #6
F = E' - D(1:4) % Calculates the difference between E and the first four elements of D

            % ZI: great!

%% #7
G = rand(100); % make a 100-element vector of random numbers
G = (G - mean(G)) / std(G); % normalize G to have a mean of 0 and standard deviation of 1

            % ZI: this would totally work if G was a vector. The way it's
            % created at the moment is a 100x100 matrix, and so the mean()
            % and std() functions create vectors of the column means and
            % deviations, and then the division will do a weird
            % matrix/vector operation. It was probably a typo in the
            % first line, so I'm not going to take points off, just make
            % sure to run it and check the output!

%% #8
% Function definition
% function matrix_out = reverse_rows(matrix_in)
%   matrix_out = flipud(matrix_in) % Reverses the rows of the input matrix
% end

H = reverse_rows(C) % make matrix H with reversed rows of C
I = reverse_rows(H) % make matrix I with reversed columns of H

           % ZI: I had intended the function to just use matrix indexing
           % (e.g. matrix_out = matrix_in(end:-1:1,:)), but I didn't
           % specifcy and this works!
           % 
           % The only issue is that I is just C again, and not H with
           % reversed columns. You'll need to transpose the input H so turn
           % columns into rows, which the function will then reverse, and
           % the transpose the output so the columns are columns again
           % i.e. I = reverse_rows(H')';
           % 2/3 points since everything else works fine, don't forget to
           % check the output to make sure it's what you expect!

%% #9 create matrix J by concatenating variables
J = zeros(5,5)
x1 = 1:5
x2 = (1:3)'
x3 = ones(3,3)
J = [x1', x2, x3; x1', x3] % Creates a 5x5 matrix J by concatenating x1, x2, and x3

            % ZI: You've got the right idea, but this generates an error since you're trying to
            % concatenate a [5x1] (x1') with a [3x1] (x2) in the first row,
            % and then a [5x1] (x1') with a [3x3] (x3). You just have to
            % pay attention to the expected dimensions. And don't forget to
            % run your code to make sure it does what you want!
            % no points here, but the rest looks great!
