%% A + B

A = [1  1   -3;
     -5 3   -4;
     1  0   2;
     1  2   0;
     -1 -1  -1];

B = [-3 1   0;
     0  2   .5;
     8  8   8;
     2  7   -8;
     9  .1  0];

C_for = zeros(size(A));
for i = 1:size(A,1)
    for j = 1:size(A,2)
        C_for(i,j) = A(i,j) + B(i,j);
    end
end

C_mat = A + B;

%% A * B

A = [1  1   -3  1   2;
     -5 3   -4  1   0;
     1  0   2   -1  1;
     1  2   0   0   12];

B = [-3 1   0;
     0  2   .5;
     8  8   8;
     2  7   -8;
     9  .1  0];

C_for = zeros(size(A,1), size(B,2));
for i = 1:size(A,1)
    for j = 1:size(B,2)
        for k = 1:size(A,2) % = size(B,1)
            C_for(i,j) = C_for(i,j) + A(i,k)*B(k,j);
        end
    end
end

C_vec = zeros(size(A,1), size(B,2));
for i = 1:size(A,1)
    for j = 1:size(B,2)
        C_vec(i,j) = sum(A(i,:).*B(:,j)');
    end
end

C_mat = A*B;



