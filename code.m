I = imread('sboynone.jpeg');
% change the names of images here

EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB = step(EyeDetect, I);

figure, imshow(I);
hold on;

if isempty(BB)
    % If no eyes are detected, assume sunglasses
    title('Sunglasses Detected');
else
    % If eyes are detected, assume no sunglasses
    for i = 1:size(BB,1)
        rectangle('Position', BB(i,:), 'LineWidth', 4, 'LineStyle', '-', 'EdgeColor', 'r');
    end
    title('Eyes Detection');
    
    % Crop the region containing the eyes
    Eyes = imcrop(I, BB(i,:));
    % Display the cropped region
    figure, imshow(Eyes);
    title('Eyes Detected - No sunglasses');
end

hold off;