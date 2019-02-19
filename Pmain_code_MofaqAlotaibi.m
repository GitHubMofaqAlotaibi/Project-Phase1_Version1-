% Mofaq Alotaibi_Phase1_Part1_CS5243 
clear all 
close all
% read image 1  
im1 ='al_color.jpg' ; 
[YCbCr1,Y1,Cb1,Cr1] = Phase1_Part1(im1,1); 
Out_11 = Phase1_Part2(YCbCr1,'4:1:1')  ; 
Out_12 = Phase1_Part2(YCbCr1,'4:4:4')  ; 
%--- plotting figure
figure  ,
subplot(2,1,1) ; imshow(Out_11)   ; 
subplot(2,1,2) ; imshow(Out_12)   ;  

%--- writing images 
imwrite (Out_11,'MofaqAlotaibi_part2_output_image_11.jpg') ; 
imwrite (Out_12,'MofaqAlotaibi_part2_output_image_12.jpg') ; 
%--------------------------------------------------------------------------
im2 ='huntsville_color.jpg';  
[YCbCr2,Y2,Cb2,Cr2] = Phase1_Part1(im2,1);
Out_21 = Phase1_Part2(YCbCr2,'4:1:1')  ; 
Out_22 = Phase1_Part2(YCbCr2,'4:4:4')  ; 
%--- plotting figure
figure, 
subplot(2,1,1) ; imshow(Out_21)   ; 
subplot(2,1,2) ; imshow(Out_22)   ; 
%--- writing images 
imwrite (Out_21,'MofaqAlotaibi_part2_output_image_21.jpg') ; 
imwrite (Out_22,'MofaqAlotaibi_part2_output_image_22.jpg') ; 
%--------------------------------------------------------------------------
im3 ='auh_color.jpg'; 
[YCbCr3,Y3,Cb3,Cr3] = Phase1_Part1(im3,1);
Out_31 = Phase1_Part2(YCbCr3,'4:1:1')  ; 
Out_32 = Phase1_Part2(YCbCr3,'4:4:4')  ; 
%--- plotting figure
figure, 
subplot(2,1,1) ; imshow(Out_31)   ; 
subplot(2,1,2) ; imshow(Out_32)   ; 
%--- writing images 
imwrite (Out_31,'MofaqAlotaibi_part2_output_image_31.jpg') ; 
imwrite (Out_32,'MofaqAlotaibi_part2_output_image_32.jpg') ;
%--------------------------------------------------------------------------
% Part 3 
k= 1 ; 

[dct_1,B_1] = Phase1_Part3(YCbCr1(:,:,1)) ; 
[dct_2,B_2] =  Phase1_Part3 (YCbCr1(:,:,2)) ; 
[dct_3,B_3] =  Phase1_Part3(YCbCr1(:,:,3)) ;

dct_g_1(:,:,1) =  dct_1 ; 
dct_g_1(:,:,2) =  dct_2 ; 
dct_g_1(:,:,3) =  dct_3 ; 

[q_1,a] = Phase1_Part4(YCbCr1(:,:,1),'L') ; 
q_2 = Phase1_Part4(YCbCr1(:,:,2),'cr') ;
q_3 = Phase1_Part4(YCbCr1(:,:,3),'cr') ;  

q_g(:,:,1) = q_1  ; 
q_g(:,:,2) = q_2  ;
q_g(:,:,3) = q_3  ;

figure  , 
subplot(3,1,1) ; imshow(dct_1)   ; 
subplot(3,1,2) ; imshow(dct_2)   ; 
subplot(3,1,3) ; imshow(dct_3)   ;

imwrite (dct_1,'MofaqAlotaibi_part3_output_image_11.jpg') ; 
imwrite (dct_2,'MofaqAlotaibi_part3_output_image_12.jpg') ; 
imwrite (dct_3,'MofaqAlotaibi_part3_output_image_13.jpg') ;
imwrite (dct_g_1,'MofaqAlotaibi_part3_output_image_13g.jpg') ;


imwrite (q_1,'MofaqAlotaibi_part4_output_image_q11.jpg') ; 
imwrite (q_2,'MofaqAlotaibi_part4_output_image_q12.jpg') ; 
imwrite (q_3,'MofaqAlotaibi_part4_output_image_q13.jpg') ; 
imwrite (q_g,'MofaqAlotaibi_part4_output_image_q13g.jpg') ; 
%--------------------------------------------------------------------------
dct_1  =  Phase1_Part3 (YCbCr2(:,:,1)) ; 
dct_2  =  Phase1_Part3 (YCbCr2(:,:,2)) ; 
dct_3  =  Phase1_Part3 (YCbCr2(:,:,3)) ;

dct_g_2(:,:,1) =  dct_1 ; 
dct_g_2(:,:,2) =  dct_2 ; 
dct_g_2(:,:,3) =  dct_3 ; 


q_1 = Phase1_Part4(dct_1(:,:,1),'L') ; 
q_2 = Phase1_Part4(dct_2(:,:,1),'cr') ;
q_3 = Phase1_Part4(dct_3(:,:,1),'cr') ;  

q_g(:,:,1) = q_1  ; 
q_g(:,:,2) = q_2  ;
q_g(:,:,3) = q_3  ;

imwrite (dct_1,'MofaqAlotaibi_part3_output_image_21.jpg') ; 
imwrite (dct_2,'MofaqAlotaibi_part3_output_image_22.jpg') ; 
imwrite (dct_3,'MofaqAlotaibi_part3_output_image_23.jpg') ; 
imwrite (dct_g_2,'MofaqAlotaibi_part3_output_image_23g.jpg') ; 


imwrite (q_1,'MofaqAlotaibi_part4_output_image_q21.jpg') ; 
imwrite (q_2,'MofaqAlotaibi_part4_output_image_q22.jpg') ; 
imwrite (q_3,'MofaqAlotaibi_part4_output_image_q23.jpg') ;
imwrite (q_g,'MofaqAlotaibi_part4_output_image_q23g.jpg') ;

%-------------------------------------------------------------------------
dct_1  =  Phase1_Part3 (YCbCr3(:,:,1)) ; 
dct_2  =  Phase1_Part3 (YCbCr3(:,:,2)) ; 
dct_3  =  Phase1_Part3 (YCbCr3(:,:,3)) ;

dct_g_3(:,:,1) =  dct_1 ; 
dct_g_3(:,:,2) =  dct_2 ; 
dct_g_3(:,:,3) =  dct_3 ; 

q_1 = Phase1_Part4(dct_1(:,:,1),'L') ; 
q_2 = Phase1_Part4(dct_2(:,:,1),'cr') ;
q_3 = Phase1_Part4(dct_3(:,:,1),'cr') ;  
q_g(:,:,1) = q_1  ; 
q_g(:,:,2) = q_2  ;
q_g(:,:,3) = q_3  ;
imwrite (dct_1,'MofaqAlotaibi_part3_output_image_31.jpg') ; 
imwrite (dct_2,'MofaqAlotaibi_part3_output_image_32.jpg') ; 
imwrite (dct_3,'MofaqAlotaibi_part3_output_image_33.jpg') ; 
imwrite (dct_g_3,'MofaqAlotaibi_part3_output_image_33g.jpg') ;



imwrite (q_1,'MofaqAlotaibi_part4_output_image_q31.jpg') ; 
imwrite (q_2,'MofaqAlotaibi_part4_output_image_q32.jpg') ; 
imwrite (q_3,'MofaqAlotaibi_part4_output_image_q33.jpg') ; 
imwrite (q_g,'MofaqAlotaibi_part4_output_image_q33g.jpg') ; 









