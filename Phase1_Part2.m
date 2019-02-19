% Mofaq Alotaibi
function Out = Phase1_Part2(In,s) 
% j:a:b 
% a = sub_sampling in rows 
% b = sub_sampling in columns
%--------------------------------------------------------------------------
% Get Image Size 
[r c d] = size (In)  ; 
% Test of performing subsampling of (4:1:1) or (4:4:4) 
% 4:1:1 is the string to be entered by the user 
%--------------------------------------------------------------------------
if (strcmp(s,'4:1:1')) 
    for i=1:2:r-2
        for k=1:4:c-4
 % performing subsampling on the first component   
            window_1 = In(i:i+1,k:k+3,2); 
 % performing subsampling on the second component             
            window_2 = In(i:i+1,k:k+3,3) ; 
            Out(i:i+1,k:k+3,2) = window_1(1,1);   
            Out(i:i+1,k:k+3,3) = window_2(1,1);
        end    
    end
%--------------------------------------------------------------------------
% Performing a subsampling of (4:4:4) means to attribute a cb and cr for
% every pixel of the 4 by 2 block
else 
       Out = In ; 
end
%--------------------------------------------------------------------------    
end
     