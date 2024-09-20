x = rand(1,10);
% compute y = x^2
tic;
y = zeros(1,length(x));
for i = 1:length(x)
    y(i) = x(i)^2;
end
toc;


%% vectorize the computation
tic;
y = x.^2;
toc;

%%
x = rand(1,10);
z = 1:10;
tic;
y = x.*z;
toc;

%%
t = 0:.05:10;
x = sin(2*pi*2*t);
figure; plot(t, x, 'Color', 'r');
hold on; plot(t, x.^2, 'Color', [0, 0, 1]);


%%

A = rand(3,4);
B = rand(3, 4);
C = zeros(3,4);
for i = 1:size(C,1)
    for j = 1:size(C,2)
        C(i,j) = A(i,j) + B(i,j);
    end
end

%%

C = A + B;

%% scalar multiplication

A = rand(3,4);
B = 2*A;

%% matrix multiplication

A = [1, 2, 3; 4, 5, 6]; % 2 x 3
B = [-1, -2; -3, -4; -5, -6]; % 3 x 2
% resultant = 2 x 2

C = A*B; % 2 x 2

C = B*A; % 3 x 3

%%

for i = 1:size(A,1) % rows of A
    for j = 1:size(B,2) % columns of B
        C(i,j) = sum(A(i,:) .* B(:,j)');
    end
end
