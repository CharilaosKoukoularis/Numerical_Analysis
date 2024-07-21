% Chapter 3.2 pages 92, 96, 99
% Gaussian Elimination Function with limited precision
% Similar Function to rref

function [U, x] = GaussElim(A,b,precision)
    arguments
        A (:,:) {mustBeNumericOrLogical}
        b (:,1) {mustBeNumericOrLogical}
        precision (1,1) = -1
    end
    infinite = -1;
    

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
            if M(r,r) == 0
                b = r + 1;
                while (b <= n - 1 && M(b,r) == 0)
                    b = b + 1;
                end
                if b ~= n 
                    [M(r,:), M(b,:)] = Swap(M(r,:), M(b,:));
                end
            end
            if precision == infinite
                k = M(i,r) / M(r,r);
            else
                k = round(M(i,r) / M(r,r), precision, 'significant');
            end
            M(i,r) = 0;
            
            for j = r+1:m
                if precision == infinite
                    M(i,j) = M(i,j) - k * M(r,j);
                else
                    M(i,j) = round(M(i,j) - k * M(r,j), precision, 'significant');
                end
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
            if precision == infinite
                sum = sum + U(i,j) * x(j);
            else
                sum = round(sum + U(i,j) * x(j), precision, 'significant');
        
            end
        end
        if precision == infinite
            x(i) = (U(i,m) - sum) / U(i,i);
        else
            x(i) = round((U(i,m) - sum) / U(i,i), precision, 'significant');
        end
    end
end