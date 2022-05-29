clc ; 
I1 = imread('self.jpg'); 
imshow(I1); 
Size12 = dir('self.jpg'); 
Size1 = (Size12.bytes)/1024;
disp(Size1);

imshow(I1); 
I = I1(:,:,1);
I = im2double(I); 
T = dctmtx(8); 
B = blkproc(I,[8 8],'P1*x*P2',T,T');
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1*x',mask); 
I2 = blkproc(B2,[8 8],'P1*x*P2',T',T);

I = I1(:,:,2);
I = im2double(I); 
T = dctmtx(8); 
B = blkproc(I,[8 8],'P1*x*P2',T,T'); 
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1*x',mask); 
I3 = blkproc(B2,[8 8],'P1*x*P2',T',T);

I = I1(:,:,3);
I = im2double(I); 
T = dctmtx(8); 
B = blkproc(I,[8 8],'P1*x*P2',T,T'); 
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1*x',mask); 
I4 = blkproc(B2,[8 8],'P1*x*P2',T',T);

L = cat(3,I2,I3,I4);
I2 = I2*10 ; 
I3 = I3*10 ; 
I4 = I4*10 ; 
I2 = round(I2);
I3 = round(I3);
I4 = round(I4);
I2 = I2(:);
I3 = I3(:);
I4 = I4(:);
I2 = abs(I2);
I3 = abs(I3) ; 
I4 = abs(I4) ; 
SeqChar = int2nt(I2); 
SeqChar2 = int2nt(I3); 
SeqChar3 = int2nt(I4);
I = isempty(SeqChar);

filename = 'one.txt';
fid = fopen(filename,'w'); 
fprintf(fid,'%s',SeqChar);  
fclose(fid); 

filename = 'two.txt'; 
fid = fopen(filename,'w');
fprintf(fid,'%s',SeqChar2);
fclose(fid);

filename = 'three.txt'; 
fid = fopen(filename,'w');
fprintf(fid,'%s',SeqChar3);
fclose(fid);

SeqCharx = convertCharsToStrings(SeqChar)
SeqCharx2 = convertCharsToStrings(SeqChar2)
SeqCharx3 = convertCharsToStrings(SeqChar3)


A1 = count(SeqCharx,"*"); 
B1 = count(SeqCharx,"-");
A2 = count(SeqCharx2,"*"); 
B2 = count(SeqCharx2,"*"); 
A3 = count(SeqCharx3,"-"); 
B3 = count(SeqCharx3,"*"); 

Sum = A1+B1+A2+B2+A3+B3 ; 

Total = length(SeqChar)+length(SeqChar2)+length(SeqChar3);

Final = Total - Sum ; 

Nano = Final/500/60 ; 

imshow(L);
imwrite(L,'Compressed.jpg');
size23 = dir('Compressed.jpg');
Size2 = (size23.bytes)/1024 ;

fprintf("The original is %f and compressed is %f \n \n",Size1,Size2);

fprintf("The time taken for 1 Nanopore Sequencer to Reading at 500 bases/second is approx : %f minutes \n", Nano);
fprintf("The time taken for 5 Nanopore Sequencer to Reading at 500 bases/second is approx : %f minutes \n", Nano/5);
fprintf("The time taken for 10 Nanopore Sequencer to Reading at 500 bases/second is approx : %f minutes \n", Nano/10);
fprintf("The time taken for 20 Nanopore Sequencer to Reading at 500 bases/second is approx : %f minutes \n", Nano/20);
fprintf("The time taken for 40 Nanopore Sequencer to Reading at 500 bases/second is approx : %f minutes \n", Nano/40);
