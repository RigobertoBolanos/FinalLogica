


clear all
close all
clc
%la imagen debe ubicarse en la misma carpeta en la que se ubique el script
x = imread('imgdino.bmp');

y = zeros(size(x));

y(:,:,1) = x(:,:,1) ~= 0;
y(:,:,2) = x(:,:,2) ~= 0;
y(:,:,3) = x(:,:,3) ~= 0;

z = y(:,:,1)*(2.^2) + y(:,:,2)*(2.^1) + y(:,:,3)*(2.^0);

fid = fopen('memoryDino.coe', 'wt');

x2 = double(z)';
x2 = x2(:);

fprintf(fid, sprintf('memory_initialization_radix=2;\n\n'));

fprintf(fid, sprintf('memory_initialization_vector=\n\n'));


for i = 1:length(x2)-1
    if x2(i) < 2
        fprintf(fid, sprintf('00%s,\n',dec2bin(x2(i))));
    elseif (x2(i) >=2) & (x2(i) <4)
        fprintf(fid, sprintf('0%s,\n',dec2bin(x2(i))));
    elseif (x2(i) >=4) & (x2(i) <8)
        fprintf(fid, sprintf('%s,\n',dec2bin(x2(i))));
    else
        fprintf(fid, sprintf('%s,\n',dec2bin(x2(i))));
    end
end

i = length(x2);
    if x2(i) < 2
        fprintf(fid, sprintf('00%s;\n',dec2bin(x2(i))));
    elseif (x2(i) >=2) & (x2(i) <4)
        fprintf(fid, sprintf('0%s;\n',dec2bin(x2(i))));
    elseif (x2(i) >=4) & (x2(i) <8)
        fprintf(fid, sprintf('%s;\n',dec2bin(x2(i))));
    else
        fprintf(fid, sprintf('%s;\n',dec2bin(x2(i))));
    end

fclose(fid);

