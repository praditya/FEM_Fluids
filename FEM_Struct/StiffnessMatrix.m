
function Kg = StiffnessMatrix(connectelem,d,frame)
% Stiffness Matrix

parameters;
di = d - 2*t;
x1 = frame(connectelem(1),1);
y1 = frame(connectelem(1),2);
x2 = frame(connectelem(2),1);
y2 = frame(connectelem(2),2);
L = sqrt((x2-x1)^2+(y2-y1)^2);
A = pi*(d^2 - di^2)/4;
I = pi*(d^4 - di^4)/64;
a = 2*E*I/(L^3);
K = E*A/L;

Klocal = [ K 0 0 -K 0 0 ;
           0 6*a -3*L*a 0 -6*a -3*L*a ;
           0 -3*L*a 2*L^2*a 0 3*L*a L^2*a ;
          -K 0 0 K 0 0 ;
           0 -6*a 3*L*a 0 6*a 3*L*a ;
           0 -3*L*a L^2*a 0 3*L*a 2*L^2*a ];
Kg = TransformationMatrix(Klocal,x1,y1,x2,y2,L);
       

end