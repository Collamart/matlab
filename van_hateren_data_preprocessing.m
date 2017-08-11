% Original size
w = 1536; h = 1024;
% First 100 images in Van Hateren dataset
for i=1:100,
    x = '0';
    if(i < 10)
        x = [x '000' int2str(i)];
    else if (i < 100)
            x = [x '00' int2str(i)];
        else
            x = [x '0' int2str(i)];
        end
    end
   % Load original image 
   f1 = fopen(['imk/imk' x '.iml'], 'rb', 'ieee-be');
   buf = fread(f1, [w, h], 'uint16');
   % Covert original image to grayscale image
   grayImage = mat2gray(buf.');
   % Crop image to 1024x1024 (refer Zhang's paper)
   grayImage = grayImage(:, (w-h)/2:(w-h)/2+1023);
   % Save image
   imwrite(grayImage, [x '.jpg']); 
end

