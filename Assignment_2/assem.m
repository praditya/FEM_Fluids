% assembly

a = 2;
e = 10;

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
    
