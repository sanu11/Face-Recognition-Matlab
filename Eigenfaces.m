function [m,A,Eigenfaces]=Eigenfaces(ImageVector)

%1.Input->2D matrix of dimension MN*no_of_images from the previous modeule(Create)
%T=create(Path)
%2.Output->mean matrix ,T-m,Eigenfaces

m=mean(ImageVector,2);  %mean(A) gives mean of rows whereas mean(A,2) gives mean of columns

column_count=size(ImageVector,2);  % Size(A,1) gives number of rows in matrix A and 2 would have given columns.

A=[];								

for i=1: column_count
	temp=double(ImageVector(:,i))-m;	%Computing the difference image for each image in the training set Ai = Ti - m  
	A=[A temp];
end

covar=A'*A;					%covariance of A

[vec eigen]=eig(covar);		%vec is matrix of all eigen vectors and eigen is the diagonal matrix  of eigen values.  


primary=[]; 				%eigen vectors of eigen values above threshold			
	

for i=1:column_count
	if( eigen(i,i)>1 )
		primary=[primary vec(:,i)];
	end
end

%format bank
%disp(size(vec));
%disp(size(eigen));
disp(size(primary));
%disp(size(A));

Eigenfaces=A*primary;       %to get original dataset in terms of eigen vectors
%disp(size(Eigenfaces));