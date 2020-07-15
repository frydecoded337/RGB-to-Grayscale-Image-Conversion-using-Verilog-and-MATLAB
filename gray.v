//CONVERSION OF COLOR IMAGE TO GRAYSCALE IMAGE
module color2gray; //module name

parameter m = 184;    //number of columns of image 
parameter n = 274;    //number of rows of image

reg [7:0] hexfile[m*n*3];    //declaring hexadecimal file to store input image
reg [7:0] grayfile[m*n];     //declaring converted gray file - hexdecimal
reg [7:0] red[m*n];          //red color values
reg [7:0] blue[m*n];         //blue color values
reg [7:0] green[m*n];        //green color values
integer file;
integer i, j, k=0;
reg [9:0] val;

initial begin 
	$readmemh("image.hex", hexfile);        //reading hexadecimal file of image into memory hexfile
end
initial begin
	for(i=0; i<m*n; i=i+1)begin
			
		red[i] = hexfile[k];           //transferring values of RGB from image hexfile to red, green, blue registers
		green[i] = hexfile[k+1];
		blue[i] = hexfile[k+2];
		val = red[i]+green[i]+blue[i];    //sum of RGB is stored in a larger register to prevent overflow
		grayfile[i] = (val)/8'h03;        //divinding sum by 3 to obtain grayscale value
		k = k + 3;
		
	end	
end
initial begin	
	file = $fopen("grayimage.hex", "w");          //creating a hex file to store grayscale values of converted image
	for(j=0; j<m*n; j=j+1)begin
		$fwrite(file, "%x\n", grayfile[j]);     //writing values into file
	end
	$fclose(file);       //closing file
end
endmodule 





