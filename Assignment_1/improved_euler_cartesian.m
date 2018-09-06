function improved_euler_cartesian(delta_t, total_time)

    % Given vortex flow equations
    % r_dot = 0
    % theta_dot = 5/r^2 
    
    % xdx + ydy = r*r_dot  ...r_dot = 0 
    % xdx + ydy = 0 
    % x = rcos(theta) dx = -5*sin(theta)/r 
    % y = rsin(theta) dy =  5*cos(theta)/r
    % theta = atan(y/x)
    
    
    % In cartesian coordinates
    % 
    
    % delta_t = 0.1;
    % total_time = 5;
    
    t = 0:delta_t:total_time;
    x = zeros(1,length(t));
    y = zeros(1,length(t));
    dx = zeros(1,length(t));
    dy = zeros(1,length(t));
    theta = zeros(1,length(t));
    r = zeros(1,length(t));
    
    % Initial_conditions
    r(1) = 1;
    theta(1) = 0;
    dx(1) = 0;
    dy(1) = 5/r(1);
    v_r = 0;
    
    
    for i=1:length(t)-1
        %improved_euler
        r(i+1) = r(i) + delta_t*v_r;
        theta(i+1) = theta(i) + delta_t*5/(r(i)^2);
        dx(i+1) = -5*sin(theta(i+1))/r(i);
        dy(i+1) =  5*cos(theta(i+1))/r(i);
        x(i+1) = x(i) + delta_t*(dx(i)+dx(i+1))/2;
        y(i+1) = y(i) + delta_t*(dy(i)+dy(i+1))/2;
        
    end
    
    plot(x,y)
    pbaspect([1 1 1]) % set aspect ratio 1
    grid on;
%     legend('theta','radius');
    title('Cartesian Plot : Improved Euler Method');
  
    
end