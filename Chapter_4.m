% Chapter 4 

% Page 180 Examples 4.1



%% Page 181 Example 4.2

x = linspace(2,4);
f = 1./x;
X = [2, 2.5, 4];
F = 1./X;

figure
plot(x,f)
hold on
grid on
title('Lagrange interpolation')
xlabel('x')

p = 0;
for i = 1:length(X)
    L = ones(1,length(x));
    for j = 1:length(X)
        if j == i 
            continue;
        end
        L = (x - X(j))./(X(i) - X(j)).*L;
    end
    p = p + F(i).*L;
end
plot(x,p,X,F,'ro')
legend('1/x','p(x)')

%% Page 183 Example 4.3

x = linspace(2,4);
f = 1./x;
X = [2, 2.5, 4];
F = 1./X;

a0 = F(1);
a1 = -1/5;
a2 = 1/20;
p = a0 + (x - X(1)).*(a1 + (x - X(2))*a2);
figure
plot(x,f,x,p,'-',X,F,'ro')
hold on
grid on
legend('1/x','p(x)')
title('Newton interpolation')
xlabel('x')

figure
plot(x,f,x,csapi(X,F,x),'-',X,F,'ro')
hold on
grid on
legend('1/x','p(x)')
title('polynomial interpolation using "csapi"')
xlabel('x')

%% Page 186 Example 4.4
% διαιρεμένες διαφορές

X = [1 3/2 0 2];
Y = [3 13/4 3 5/3];
DividedDifferences(3,X,Y)
DividedDifferences(2,X,Y)
DividedDifferences(1,X,Y)
DividedDifferences(0,X,Y)

%% Page 228 Exercise 4.4

x = linspace(1,4);
f = log(x);
figure
plot(x,f)
hold on
grid on
xlabel('x')
X = 1:4;
F = log(X);
% splines