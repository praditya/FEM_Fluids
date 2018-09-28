
clear all;
% local
n = 100; % number of elements
h = 1/n; % uniform mesh grid 
q = 1;

% local Stiffness matrix
K_local = n*[ 1 -1 ; -1 1];

% local Force matrix 
% f(x) = q*x

% F_local = (q*n/6)*[ 2*x1 + x2 ; x1 + 2*x2];
