% Mofaq Alotaibi
function [I2,quantized_image_128x128] = Phase1_Part4 (In,a)  
% definition of quantization table
% we distingush two tables 
% first table for luminance component 
In = imresize(In,[512,512]) ; 
I = im2double(In) ; 
[r c] = size (In) ; 
%Out = zeros(r,c) ; 

%--------------------------------------------------------------------------
 T_1 = [16,11,10,16,24,40,51,61; 
     12,12,14,19,26,58,60,55 ; 
     14,13,16,24,40,57,69,56 ; 
     14,17,22,29,51,87,80,62 ; 
     18,22,37,56,68,109,103,77 ; 
     24,35,55,64,81,104,113,92 ; 
     49,64,78,87,103,121,120,101; 
     72,92,95,98,112,100,103,99 
     ] ; 
% second table for chrominance components 
 T_2 = [
     17,18,24,47,99,99,99,99; 
     18,21,26,66,99,99,99,99 ; 
     24,26,56,99,99,99,99,99 ; 
     47,66,99,99,99,99,99,99 ; 
     99,99,99,99,99,99,99,99 ; 
     99,99,99,99,99,99,99,99 ; 
     99,99,99,99,99,99,99,99 ; 
     99,99,99,99,99,99,99,99 ; 
     ] ;
% Test input user 
%--------------------------------------------------------------------------
if (a=='L')
    quantification_table = T_1 ; 
    elseif (a=='cr')
    quantification_table = T_2 ; 
    else 
    quantification_table = ones(8,8) ; 
end
% we apply quantification for every block of 8*8 pixels 
%--------------------------------------------------------------------------
%
    %Compute the two-dimensional DCT of 8-by-8 blocks in the image. The function dctmtx returns the N-by-N DCT transform matrix.
    T = dctmtx(8);
    dct = @(block_struct) T * block_struct.data * T';
    B = blockproc(I,[8 8],dct); 

    %Discard all but 10 of the 64 DCT coefficients in each block.
    mask = [1   1   1   1   0   0   0   0
            1   1   1   0   0   0   0   0
            1   1   0   0   0   0   0   0
            1   0   0   0   0   0   0   0
            0   0   0   0   0   0   0   0
            0   0   0   0   0   0   0   0
            0   0   0   0   0   0   0   0
            0   0   0   0   0   0   0   0];
    
    quantization_matrix_128x128 = repmat((ceil(double(T_1)./100)),64,64 );  
    quantized_image_128x128 =  round(B ./quantization_matrix_128x128) ; %round operation should be done here for lossy quantization
    B2 = blockproc(quantized_image_128x128,[8 8],@(block_struct) mask .* block_struct.data); 
    %Reconstruct the image using the two-dimensional inverse DCT of each block
    invdct = @(block_struct) T' * block_struct.data * T;
    I2 = blockproc(B2,[8 8],invdct); 

%--------------------------------------------------------------------------
end