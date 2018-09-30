% assembly

local;
read_params;

LM = zeros(a,e);

for i= 1:a
    for j=1:e
        LM(i,j) = j + i - 1;
    end
end    



% Assemble Stiffness Matrices
K_global = zeros(e+1);

for i=1:e
    for j=1:a
        for k=1:a
            K_global(LM(j,i),LM(k,i)) = K_global(LM(j,i),LM(k,i)) + K_local(j,k);
        end    
    end
end    

% Assemble Force Matrix
F_global = zeros(e+1,1);

for i=1:e
    F_global(LM(1,i)) = F_global(LM(1,i)) + (q*h/6)*( 2*(LM(1,i)-1)*h + (LM(2,i)-1)*h );
    F_global(LM(2,i)) = F_global(LM(2,i)) + (q*h/6)*( (LM(1,i)-1)*h + 2*(LM(2,i)-1)*h );
end

% Get displacement field 
% K_global*d = F_global
% Thomas algorithm

d = thomasalgo(K_global,F_global); % solution to nodal displacements
x = 0:h:1;
% scatter(x,d)


% 




