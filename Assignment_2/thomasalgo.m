%% thomasalgo algorithm
function d = thomasalgo(K,F) 

p = length(F);
d = zeros(1,p);

a = zeros(1,p);
b = zeros(1,p);
c = zeros(1,p);

for i = 1:p
    if i>1
    a(i) = K(i,i-1);
    end
    b(i) = K(i,i);
    if i<p
    c(i) = K(i,i+1);
    end
end    

for i = 2:p
        f = a(i)/b(i-1);
        b(i) = b(i)-c(i-1)*f;	
        F(i) = F(i)-F(i-1)*f;
end

d(p) = 0; % Boundary condition at right end

for i = (p-1):-1:1        
       d(i) = (F(i)-c(i)*d(i+1))/b(i);
end
 
end 