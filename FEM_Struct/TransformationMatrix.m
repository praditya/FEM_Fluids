
function [Kglobal_i] = TransformationMatrix(Klocal,x1,y1,x2,y2,L)
% Transformation Matrix
l = (x2-x1)/L;
m = (y2-y1)/L;
Q = [ l -m 0 0 0 0 ;
      m  l 0 0 0 0 ;
      0 0 1 0 0 0  ;
      0 0 0 l -m 0 ;
      0 0 0 m  l 0 ;
      0 0 0 0 0  1 ];

% Utilde = Q*Ucap;
Kglobal_i = Q'*Klocal*Q;

end
