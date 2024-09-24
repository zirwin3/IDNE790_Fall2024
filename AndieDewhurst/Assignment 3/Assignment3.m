% ZI: Great job! Just don't forget to check the output and make sure it's
% what you expect. Grade: 86


%% Question 1
A = ones(4, 5);
A(3,4) = -1;
A(:,1) = -1:-1:-4;
                % ZI: Missing the 2nd row replaced with 4-8, but otherwise
                % perfect! 3/4 points

%% Question 2
B = zeros(size(A));
 B(3:4, 1:3) = A(2:3,2:4);

                % ZI: perfect!

%% Question 3 
C = A+B;
CLessZero = sum(C<0);   
C(C<0) = 0;

                % ZI: Great! don't forget to specify 'all' for the dimension input
                % of sum() if you want to sum over the whole matrix.
                % Otherwise, you get a vector of column sums by default
%% Question 4
D = mean(C);    % ZI: i like to specify the dimension as 1 even through that's the default
                % just for clarity, but this works!
D_2 = sum(C)/size(C,2); % ZI: a good example of why it helps to specify dimensions.
                        % Here, you've taken the column sums (as intended),
                        % but divided by the number of columns instead of
                        % the number of rows. But you've got the right
                        % idea! 1/2 points

%% Question 5
E = sum(C,2)';  % ZI: you've got the right numbers, but remember that a column
                % vector is an [N x 1] vector

%% Question 6
F = zeros(size(E));

for i = 1:length(E)
    F(i+1) = E(i)-D(i)';
end

                % ZI: You've got the right idea, but I think you've mixed
                % up three methods. You can either pre-allocate F (which
                % you've done) and then fill it in with the for loop, or
                % you can create F as an empty matrix and then fill it in by 
                % concatenating a new element onto the end in the for loop
                % (which you've done with the 'i+1' index). Here, you've
                % accidentally skipped the first element of F so you end up with 
                % an extra 0 at the beginning. If you're doing the for loop
                % method, you also don't need the transpose of D, since
                % you're just pulling out a single value. The non-for loop
                % method could also just be F = E - D(1:4); 
                % 3/4 points


%% Question 7
G = rand(1,100);
G = (G - (mean(G)) / std(G));
                % ZI: so close, don't forget to keep a close eye on your
                % parentheses! Here, you've enclosed the mean() function in
                % parentheses, which doesn't do much (since functions
                % always get evaluated first), so the order of operations
                % is G minus (mean divided by standard deviation)
                % instead of (G minus mean) divided by standard deviation
                % 3/4 points

%% Question 8 
H = reverse_rows(C,1);
I = reverse_rows(C,2);

                % ZI: great! i like the input-checking and default behavior!
                % the other way to write the function is to use indexing: 
                %  function out = reverse_rows(in)
                %   out = in(end:-1:1,:);

%% Question 9
x1 = 1:5;
x2 = (1:3)';
x3 = ones(3,3);
J = [x1;x2,x3,x2;x1];   % ZI: perfect!