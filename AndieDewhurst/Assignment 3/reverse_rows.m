function B = reverse_rows(A,dim)
%Flips a matrix A according to the dimension provided.
% B = reverse_rows(A,dim) 
%%
if ~exist('dim','var') % set default value if none provided.
        dim = 1;
end

B = zeros(size(A)); % Preallocate and pre-define
i2 = 0;

for i = size(A,dim):-1:1
    i2 = i2+1; 

    if dim == 2 % flip according to the columns
        grabbed = A(:,i);
        B(:,i2) = grabbed;

        elseif dim == 1 % flip according to rows
            grabbed = A(i,:);
            B(i2,:) = grabbed;
  
        else % If someone tries to make this do more than 2 dimensions
            error('I am not coding this to deal with more than 2 dimensions. Sorry not sorry.')

    end
end

%Technically you can get rid of all the rest of the code and just uncomment
%what's below.
%B = flip(A,dim);