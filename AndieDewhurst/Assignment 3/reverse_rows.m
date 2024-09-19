function y = reverse_rows(x)
%Technically correct is the best kind of correct?
%y = flip(x,dim);

%%
y = zeros(size(x));
i2 = 0;
% grab each subsequent row from test and vertcat below test2
for i = size(x,1):-1:1
   grabbed = x(i,:);
   i2 = i2+1;  
   y(i2,:) = grabbed;
end
