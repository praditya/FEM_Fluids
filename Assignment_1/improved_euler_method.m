function improved_euler_method(delta_t, total_time)

    % Given vortex flow equations
    % r_dot = 0
    % theta_dot = 5/r 
    
    % delta_t = 0.1;
    % total_time = 5;
    
    t = 0:delta_t:total_time;
    r = zeros(1,length(t));
    theta = zeros(1,length(t));
    
    % Initial_conditions
    r(1) = 1;
    theta(1) = 0;
    v_r = 0;
    
    for i=1:length(t)-1
        %improved_euler
        r(i+1) = r(i) + delta_t*v_r;
        theta(i+1) = theta(i) + delta_t*(5/(r(i)^2)+5/(r(i+1)^2))/2;
    end
    
    polar(theta,r)
%     legend('theta','radius');
    title('Polar Plot : Improved Euler Method');
    
    
end