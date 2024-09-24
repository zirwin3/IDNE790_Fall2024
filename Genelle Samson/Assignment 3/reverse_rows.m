%% This function takes in a matrix and outputs the same matrix
% with the rows reversed.
% 
% Inputs:
%  * in = input matrix
% Outputs:
%  * out = output matrix, where rows are same as 'in' but reversed
%%%%%%%%%%

function out = reverse_rows(in)

out = in(end:-1:1, :);

end