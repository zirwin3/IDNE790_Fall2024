% ZI: great work! just don't forget semicolons ;)

%%  1)

A = ones(4,5)

A(2, :) = (4:8)

A(3, 4) = -1

A(:,1) = (-1:-1:-4)

        % ZI: perfect!

%% 2)

B = zeros(4,5)

B(3:4,1:3) = A(2:3, 2:4)

        % ZI: perfect!

%% 3)

C = A+B

sum(C < 0, "all")  % there are 4 elements that are less than 0

C(1:2, 1) = 0;
C(3, 4) = 0;
C(4, 1) = 0

    % ZI: perfect! to make things easier for yourself, you can also use
    % logical indexing to select the elements when setting to 0 
    % (i.e. C(C < 0) = 0

%% 4)

D = mean(C)

D_2 = sum(C/4)

    % ZI: perfect! I like to specify a dimension in the mean() and sum()
    % functions, even when you're acting along the default/column dimension
    % just for clarity's sake, but this works. Also, you could do
    % sum(C,1)/size(C,1) so you don't have to hard-code the number of rows

%% 5)

E = sum(C,2)

    % ZI: perfect

%% 6)

F = E' - D(1:4)

    % ZI: perfect!

%% 7)

G = rand(1,100)

G = (G-mean(G))/std(G)

    % ZI: perfect! don't forget semicolons if you don't want MATLAB to
    % print out hundreds of values!

%% 8)

H = reverse_rows(C)

I = reverse_rows(H')'

    % ZI: perfect!

%% 9)

x1 = 1:5;
x2 = (1:3)';
x3 = ones(3,3);

J = [x1;x1;x2,x2,x3]

    % ZI: perfect!
