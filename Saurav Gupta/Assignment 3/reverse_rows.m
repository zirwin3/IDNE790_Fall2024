function output_matrix = reverse_rows(input_matrix)
    output_matrix = input_matrix(end:-1:1, :);  % Reverse the rows
end