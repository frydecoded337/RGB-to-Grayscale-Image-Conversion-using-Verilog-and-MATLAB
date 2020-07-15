%CONVERTING BITMAP IMAGE INTO A HEX FILE

b = imread('boat1.bmp'); %reading a bitmap image
k = 1;
s = size(b)     %indicates number of rows and columns of read image 
rows = s(1); cols = s(2);
a = ones(rows*cols, 1);
for i = 1:rows
      for j = 1:cols
            a(k)=b(i,j,1);     %writing all rgb values into an array 
            a(k+1)=b(i,j,2);
            a(k+2)=b(i,j,3);
            k=k+3;
            
      end
end
% size(a)
hexfile = fopen('image.hex', 'wt');  %creating a hexadecimal file to store written image values
fprintf(hexfile, '%x\n', a);    %writing into file
disp('Text file write done');disp(' ');
fclose(hexfile);    %closing file

sizefile = fopen('sizefile.hex', 'wt');  %creating a hexadecimal file to store image size
fprintf(sizefile, '%x\n', s);
disp('Size file write done');
fclose(sizefile); 
%by - Rachana T G, R Amrutha Varshini, Purva S, Priya Bhat


            
      
      
