%% Question 1

A = ones(4,5);

%% Question 1A

A(2,:) = [4:8];

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

%% Question 3B

C(C<0) = 0;

%% Question 4

D = mean(C,1);

%% Question 4A

D_2 = zeros(1, length(C));
for i = 1:length(C)
    D_2(i) = [(sum(C(:,i))/size(C,1))]
end

%% Question 5

E = sum(C,2);

%% Question 6

F = E' - D(1, 1:4);

%% Question 7

G = rand(1,100);

%% Question 7a

G = normalize(G);
mean(G);
std(G);

%% Question 8 - reverse_rows function saved in separate file

%% Question 8A

H = reverse_rows(C);

%% Question 8B

H2 = H';
I = reverse_rows(H2);
I = I';

%% Question 9

x1 = [1:5];
x2 = (1:3)';
x3 = ones(3,3); 

J1 = [x3 x2 x2];
J = [J1; x1; x1];






























