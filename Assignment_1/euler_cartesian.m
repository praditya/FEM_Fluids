function euler_cartesian(delta_t, total_time)

    % Given vortex flow equations
    % r_dot = 0
    % theta_dot = 5/r^2 
    
    % xdx + ydy = r*r_dot  ...r_dot = 0 
    % xdx + ydy = 0 
    % x = rcos(theta) dx = -5*sin(theta)/r 
    % y = rsin(theta) dy =  5*cos(theta)/r
    % theta = atan(y/x)
        
    % In cartesian coordinates
    
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
    v_r = 0;
    x(1) =1;
    y(1) = 0;
    
    for i=1:length(t)-1
        %forward_euler
        r(i+1) = r(i) + delta_t*v_r;
        theta(i+1) = theta(i) + delta_t*5/(r(i)^2);
        dx(i) = -5*sin(theta(i))/r(i);
        dy(i) =  5*cos(theta(i))/r(i);
        x(i+1) = x(i) + delta_t*dx(i);
        y(i+1) = y(i) + delta_t*dy(i);
        
    end
    
    plot(x,y)
    pbaspect([1 1 1]) % set aspect ratio 1
%     xlim([-1.5 1.5]);
%     ylim([-1.5 1.5]);
    grid on;
    title('Cartesian Plot : Euler Method');
    
end