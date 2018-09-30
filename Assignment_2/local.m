
clear all;
% local
read_params;

% local Stiffness matrix
K_local = e*[ 1 -1 ; -1 1];

% local Force matrix 
% f(x) = q*x

% F_local = (q/(6*e))*[ 2*x1 + x2 ; x1 + 2*x2];