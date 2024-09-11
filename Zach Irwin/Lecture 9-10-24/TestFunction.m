% [z, z2] = TestFunction(var1, var2)
%
% This is a function to test functions in MATLAB. Takes in 2 inputs, and
% returns 2 outputs:
%
% inputs:
%   * var1 - single number
%   * var2 - single number
%
% outputs:
%   * z - single number = var1^2 + (var2/(var1*2))
%   * z2 - single number = z*2

function [z, z2, varx1] = TestFunction(var1, var2)

[varx1, varx2] = LocalTestFunction(var1, var2);

z = varx1^2 + (varx2/(varx1*2));

z2 = z*2;

end

% This is a helper function for my TestFunction function
function [varx1_int, varx2_int] = LocalTestFunction(var1, var2)
    varx1_int = var1 + 10;
    varx2_int = var2/6;
end