
 
function KG = AssembleMatrix(connectmat, frame, odmat)
 
 
 nelem = size(connectmat,1);
 nnodes = size(frame,1);
 parameters;
 

 KG = zeros(ndof*nnodes,ndof*nnodes);
 
 
 for i=1:nelem
 	for j=1:6
 		for k=1:6
 			
            Kg = StiffnessMatrix(connectmat(i,:),odmat(i),frame);
            
		KG( 3*connectmat(i,floor((j+2)/3))-3+j-(3*floor(j/4)) , 3*connectmat(i,floor((k+2)/3))-3+k -(3*floor(k/4)) ) = KG( 3*connectmat(i,floor((j+2)/3))-3+j-(3*floor(j/4)) , 3*connectmat(i,floor  			((k+2)/3))-3+k - (3*floor(k/4)) )  +  Kg(j,k);
%  	KG(3*connectmat(i,2)-1+j,3*connectmat(i,2)-1+k) = KG(3*connecctmat(i,2)-1+j,3*connectmat(i,2)-1+k) + Kg(j+3,k+3);
 		
 		end
 	end
 end

end 



