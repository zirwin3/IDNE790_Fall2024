%% 1
A = ones(4, 5);
A(2,:) = 4:8;
A(3,4) = -1;
A(:,1) = -1:-1:-4;
disp(A)

%% 2
B = zeros(size(A));
B(3:4,1:3) = A(2:3,2:4);
disp(B)

%% 3
C = A + B;
sprintf('The number of elements of C less than 0 is %d', sum(C < 0, 'all'))
C(C < 0) = 0;
disp(C)

%% 4
D = mean(C,1);
disp(D)

D_2 = sum(C,1)/size(C,1);
disp(D_2);

%% 5
E = sum(C,2);
disp(E)

%% 6
F = E' - D(1:4);
disp(F);

%% 7

G = rand(1,100);
G = (G - mean(G))/std(G);

%% 8

reverse_rows = @(x) x(end:-1:1,:);
H = reverse_rows(C);
I = reverse_rows(H')';

disp(H);
disp(I);

%% 9

x1 = 1:5;
x2 = (1:3)';
x3 = ones(3,3);
J = [x1;x2,x3,x2;x1];
disp(size(J))
