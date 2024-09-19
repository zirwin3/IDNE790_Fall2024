% assignment 3
%% #1
A = ones(4,5)  % make a 4x5 matrix of ones
A(2,:) = 4:8   % replace the 2nd row with numbers 4-8
A(3,4) = -1    % replace the element in the 3rd row, 4th column with -1
A(:,1) = (-4:-1) % replace the 1st column with numbers -1 through -4

%% #2
B = zeros(size(A)) % create a matrix of zeros the same size as A
B(3:4,1:3) = A(2:3,2:4) % replace the third and fourth rows of B with the 2nd and 3rd rows of A

%% #3
C = A + B % sum of matrices A and B
lessthanzero = sum(C(:) < 0) % counts elements less than zero in C
C(C < 0) = 0 % replace elements in C less than zero with zero

%% #4
D = mean(C, 1) % mean of each column of C
D_2 = (sum(C,1)) / (size(C,1)) % the mean of each column of C without using mean()

%% #5
E = sum(C,2) % sum of each row of C

%% #6
F = E' - D(1:4) % Calculates the difference between E and the first four elements of D

%% #7
G = rand(100) % make a 100-element vector of random numbers
G = (G - mean(G)) / std(G) % normalize G to have a mean of 0 and standard deviation of 1

%% #8
% Function definition
function matrix_out = reverse_rows(matrix_in)
  matrix_out = flipud(matrix_in) % Reverses the rows of the input matrix
end

H = reverse_rows(C) % make matrix H with reversed rows of C
I = reverse_rows(H) % make matrix I with reversed columns of H

%% #9 create matrix J by concatenating variables
J = zeros(5,5)
x1 = 1:5
x2 = (1:3)'
x3 = ones(3,3)
J = [x1', x2, x3; x1', x3] % Creates a 5x5 matrix J by concatenating x1, x2, and x3

