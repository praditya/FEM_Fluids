
% Plot for slope for 'e' elements 
x = 0:0.000001:1;
du_h_1 = zeros(1,length(x));
for i=1:length(x)
    for j=1:e
      if(x(i)<=j*h)
         du_h_1(i)= du_h(j);   
         break;
      end
    end  
end      
plot(x,du_h_1,'LineWidth',1.5);
% scatter(x,du_h_1)
xlabel('x');
ylabel('slope ');
title('Slope of displacement ');