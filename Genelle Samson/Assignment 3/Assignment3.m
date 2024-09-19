%%  1)

A = ones(4,5)

A(2, :) = (4:8)

A(3, 4) = -1

A(:,1) = (-1:-1:-4)

%% 2)

B = zeros(4,5)

B(3:4,1:3) = A(2:3, 2:4)

%% 3)

C = A+B

sum(C < 0, "all")  % there are 4 elements that are less than 0

C(1:2, 1) = 0;
C(3, 4) = 0;
C(4, 1) = 0

%% 4)

D = mean(C)

D_2 = sum(C/4)

%% 5)

E = sum(C,2)

%% 6)

F = E' - D(1:4)

%% 7)

G = rand(1,100)

G = (G-mean(G))/std(G)

%% 8)

H = reverse_rows(C)

I = reverse_rows(H')'

%% 9)

x1 = 1:5;
x2 = (1:3)';
x3 = ones(3,3);

J = [x1;x1;x2,x2,x3]
