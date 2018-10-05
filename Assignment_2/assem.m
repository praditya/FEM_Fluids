% assembly

local; % defined local elemental matrices
read_params; % set parameters in read_params file

LM = zeros(a,e); % LM array

for i= 1:a
    for j=1:e
        LM(i,j) = j + i - 1;
    end
end    

% Assemble Stiffness Matrices
K_global = zeros(e+1);
% used K_global as per node points and not wrt to no. of eqn
% Could've used K _global accordingly
% After substituting boundary condition, the K_global could be solved

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
% Thomas algorithm - Used for sparse matrices : Tridiagonal K_global

d = thomasalgo(K_global,F_global); % solution to nodal displacements
% else would have removed last row and column to make K non-singular
% if size of K is reduced, then direct inverse can be taken
x = 0:h:1;
figure(1)
plot(x,d,'-o','LineWidth',1.5) 
xlabel('x');
ylabel('d (displacement)')
title('Displacement field ')
% slope from forward difference : will give exact answer since linear interpolation
du_h = (1/h)*(d(2:e+1)-d(1:e));

% exact solution
u = @(y)q*(1 - y^3)/6;
du = @(y)(-q*y^2/2); % derivative of exact solution

error = zeros(1,e); % initialised re_x
p = zeros(1,e); % position where re_x are evaluated

for i=1:e
    p(i) = (2*i-1)*h/2;
    % error array is re_x at midpoint of the element 
    error(i) = abs(du(p(i))-du_h(i))/(q/2);
end    

% rat(error) for rational form of re_x
% Obtained re_x, for all values of h or no. of elements


%% re_x plot 

h_2 = [ 1 0.5 0.25 1/10 1/50 1/100];
error_2 = [1/12 1/48 1/192 1/1200 1/30000 1/120000];
figure(2)
plot(log(h_2),log(error_2),'-o','LineWidth',2);
xlabel('ln(h)');
ylabel('ln(re_x)');
title('ln(re_x) vs ln(h)');

figure(3)
slope; % slope of displacement field (du_h)
