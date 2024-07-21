% Page 186 Example 4.4
% διαιρεμένες διαφορές

function output = DividedDifferences(i,x,y)
    if length(x) > i+1
        x = x(1:i+1);
        y = y(1:i+1);
    end
        if i == 0
            output = y(1);
        else
            output = (DividedDifferences(i-1,x(2:end),y(2:end)) - DividedDifferences(i-1,x(1:end-1),y(1:end-1)))/(x(end) - x(1));
        end
    %end
end