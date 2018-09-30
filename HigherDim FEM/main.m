
% General n-dimensional problem FEM

nen = 4; % Local node number (a)
ndof = 2; % Number of degree of freedom (i)
neq = 20; % Number of equations (P)
nnp = 12; % Global node number (A) 
nel = 6; % Number of elements (e)
nee = 8; % Local equation number (p)

% P = ID(i,A)
% A = IEN(a,e)
% P = LM(p,e) = LM(i,a,e) = ID(i,IEN(a,e))
% p = ned(a-1)+i;