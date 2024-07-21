% Chapter 4 

%% Random Example
A = [0 2 3; 1 1 2; 2 0 3];
b = [-1; 0; -1];
[U, x] = GaussElim(A,b)

%% Page 93 Example 3.1
A = [0 1 2; 2 -2 1; 5 3 1];
b = [3; 6; 4];
[U, x] = GaussElim(A,b)

%% Page 99 Example from paragraph 3.2.2
A = [0.0001 1; 1 1];
b = [1; 2];
[U, x] = GaussElim(A,b,3)

[U, x] = GaussElim(A,b,4)

[U, x] = GaussElim(A,b)

%% Page 102 Example 3.2
A = [0 1 2 3; 2 -2 1 6; 5 3 1 4];
[U, x] = GaussElimPartDrive(A)