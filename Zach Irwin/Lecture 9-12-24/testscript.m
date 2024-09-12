x = 20;
if (x > 5)
    disp('the outer statement is true')
    if (x < 30)
        x = x + 100;
        disp('the inner if statement is true')
    else
        x = x/5;
        disp('the inner statement is false')
    end
else
    x = x^2;
    disp('the outer statement is false')
end

disp(x);