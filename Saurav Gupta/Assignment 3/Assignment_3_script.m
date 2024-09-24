% ZI: Great work! Try this format for the next assignment, it should be a
% bit simpler for you (and me to grade). Also don't forget your semicolons!
% Grade: 96


%%
A = ones(4, 5);


%1a
A(2, :) = 4:8;

%1b
A(3,4) = -1



%1c
A(:, 1) = -1 :-1:-4

    % ZI: great! don't forget to use semicolons at the end when you don't
    % want matlab to print out the result

%% 2
B = zeros(4, 5)
    % ZI: nice! you can also do B = zeros(size(A))

%2a
B(3:4, 1:3) = A(2:3, 2:4)


%% 3
C = A+B



%3a
C < 0


c = sum(C<0, 1)

sum (c)

    % ZI: Great! You can also just do sum(C, 'all') instead of
    % sum(sum(Q3)), but that also works.

%3b
C(C< 0) = 0


%% 4
D = mean(C, 1)


%4a
D_2 = sum(C, 1)/size(C,1)

    % ZI: Great job!

%% 5
E = sum (C, 2)


%% 6
d = D(1:4)

F = E-d'

    % ZI: Nice! You can also combine these steps (e.g. F = E - D(1:4)'),
    % but this makes the steps clearer. Also remember that a row vector is
    % a [1 x N], so you'd have to switch the transpose to the E vector

%% 7

G = rand(1, 100);
G0 = mean (G)


G1 = std (G)


Normalize_G = (G-G0)/G1;

    % ZI: Nice! You can also combine these steps 
    % (e.g. Normalize_G = (G - mean(G))/std(G)), but this does make the
    % steps clearer


%% 8


 H = reverse_rows(C)
 I = H'

    % ZI: You've got the right idea, the function and H are perfect! For I,
    % we wanted the columns of H to be reversed, not just the transpose of
    % H (which turns the columns of H into rows). So you'd need to do
    % something like I = reverse_rows(H')';
    % 2/3 points


%% 9 
x1 = 1:5
x2 = (1:3)'
x3 = ones(3,3)
J = [x1; x1; x2,x2,x3] 
