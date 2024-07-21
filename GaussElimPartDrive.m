% Chapter 3.2 pages 92, 96
% Gaussian Elimination with Partial Drive Function
% Similar Function to rref

function [U, x] = GaussElimPartDrive(A,b)

    % Arguments check: works with augmented matrix or 
    [n,m] = size(A);
    if m == n
        M = [A b];
        m = n + 1;
    else
        M = A;
    end
    
    for r = 1:n-1
        for i = r+1:n
            maximum = max(abs(M(r:n,r)));
            if abs(M(r,r)) ~= maximum
                b = r + 1;
                while (abs(M(b,r)) ~= maximum)
                    b = b + 1;
                end
                [M(r,:), M(b,:)] = Swap(M(r,:), M(b,:));
            end
            k = M(i,r) / M(r,r);
            M(i,r) = 0;
            
            for j = r+1:m
                M(i,j) = M(i,j) - k * M(r,j);
            end
        end
    end
    U = M;

    % Solving Method
    x = zeros(n,1);
    x(n) = U(n,m) / U(n,n);
    for i = n-1:-1:1
        sum = 0;
        for j = n:-1:i
            sum = sum + U(i,j) * x(j);
        end
        x(i) = (U(i,m) - sum) / U(i,i);
    end
end