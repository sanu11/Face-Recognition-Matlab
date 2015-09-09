function ImageVector= Create(Path)
%1.Input-Path of training database.
%2.Output-2D facevector of size MN*No_of_images.Where M*N is the dimension of each image.

Files=dir(Path); %Returns a Structure(name,bytes,date etc) for every file in given directory.(Including '.','..')
image_count=0;

for i=1: size(Files,1)
	if not (strcmp(Files(i).name,'.') | strcmp(Files(i).name,'..'))         % to ignore the '.' and '..' files.
		image_count=image_count+1;
    end
end

%image_count gives no_of_images.
ImageVector=[];

for i=1: image_count
	str=int2str(i);
	str=strcat(Path,'\',str,'.jpg');  %get the complete path of image
	img=imread(str);          	 		%reads the image
	%img=rgb2gray(img);        			%To reduce errors due to color variance.
	[row col]=size(img);
	ImageVector=[ImageVector reshape(img,row*col,1)];    %Create MN*1 matrix for every image and append to IamgeVector .
end

%imshow(strcat(Path,'\',Files(130).name));
% Here we create a 1d matrix of dimension MN*1 for every image so as to get a  2d matrix  of dimension MN*no_of_images .
