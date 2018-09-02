
%converts .jpg image to .bmp

for i=400:500
    a=num2str(i);           %converts i from a number to a string to make it suitable for concatenation
    b='.jpg';
    c1='.bmp'
    filename=strcat(a,b);   %concatenate .jpg extension to filename
    c=imread(filename);     %load the image file
    d=imresize(c,[256 256]);    %resize the image
m=strcat(a,c1);             %convert the resized image to .bmp
    imwrite(d,m);           %overwite the file
end