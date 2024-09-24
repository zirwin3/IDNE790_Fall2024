%% Great work! Grade: 100

%% Question 1

A = ones(4,5);

%% Question 1A

A(2,:) = [4:8];

    % ZI: perfect! technically, you don't need the brackets when you use
    % the colon operator, but it doesn't hurt anything

%% Question 1B

A(3,4) = -1;

%% Question 1C


A(:,1) = [-1:-1:-4];

%% Question 2

B = zeros(4,5);

%% Question 2A

B(3:4,1:3) = A(2:3,2:4);

%% Question 3

C = A + B;

%% Question 3A

Q3 = C < 0;
Q3A = sum(Q3);
sum(Q3A)

    % ZI: Great! You can also just do sum(Q3, 'all') instead of
    % sum(sum(Q3)), but that also works.

%% Question 3B

C(C<0) = 0;

%% Question 4

D = mean(C,1);

%% Question 4A

D_2 = zeros(1, length(C));
for i = 1:length(C)
    D_2(i) = [(sum(C(:,i))/size(C,1))]
end

    % ZI: great work! you can make this a little simpler using the fact
    % that sum() can give you the column sums directly. E.g. D2 =
    % sum(C,1)/size(C,1). Also remember you don't need brackets if it's a
    % single number

%% Question 5

E = sum(C,2);

%% Question 6

F = E' - D(1, 1:4);

    % ZI: Excellent! You don't technically need the 1 in the first
    % dimension, since D is a vector, but it does make it slightly clearer

%% Question 7

G = rand(1,100);

%% Question 7a

G = normalize(G);
mean(G);
std(G);

    % ZI: Nice, I didn't even know about this function! To do it manually,
    % you can do G = (G - mean(G))/std(G)

%% Question 8 - reverse_rows function saved in separate file

%% Question 8A

H = reverse_rows(C);

    % ZI: Excellent! Don't forget to put semicolons when you don't want the
    % function to print things (most of the time)

%% Question 8B

H2 = H';
I = reverse_rows(H2);
I = I';

    % ZI: Great! You can also combine all these steps (e.g. I =
    % reverse_rows(H')';), but this definitely makes the steps clearer!

%% Question 9

x1 = [1:5];
x2 = (1:3)';
x3 = ones(3,3); 

J1 = [x3 x2 x2];
J = [J1; x1; x1];

    % ZI: Nice! You can also combine J1 and J into a single statement
    % (e.g. J = [[x3 x2 x2];x1;x1]), but this definitely makes it clearer!





























