function output_image=Recog(m,A,Eigenfaces,Test_image)

%1.input:-Eigenfaces,A,m from the previous module and test image from user.
%2.output:-recognised image.


%calculating weight_matrix

wt_matrix=[];
counter=size(Eigenfaces,2);    %number of eigen vectors in eigenfaces.
for i=1:counter
	temp=Eigenfaces'*A(:,i); 	%multiply a image column(A(:,i)) with every vector in (Eigenfaces')
	wt_matrix=[wt_matrix temp];
end

%--------------------------------------------------------------------------------------------------------------------%

%Test image

%Test=rgb2gray(Test_image)
Test=imread(Test_image);
[row col]=size(Test);
Test1=reshape(Test,row*col,1);
diff_image=double(Test1)-m;  		%subtract mean from test_image

Test2=Eigenfaces'*diff_image; 				%weight matrix for test image ..dimension 19*1;

%-------------------------------------------------------------------------------------------------------------------%

%Euclidian distance;

Euc_dis=[];
counter=size(wt_matrix,2);
for i=1:counter
	temp=(norm(Test2-wt_matrix(:,i)))^2;					%norm:-adds square of every row and takes square_root of the end sum
	Euc_dis=[Euc_dis temp];
end
[min_value index]=min(Euc_dis);
disp(index);
output_image=strcat(int2str(index),'.jpg')
%disp(output_image);