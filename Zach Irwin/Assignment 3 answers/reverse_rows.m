function output_mat = reverse_rows(input_mat)

output_mat = input_mat(end:-1:1,:);
% output_mat = flipud(input_mat);