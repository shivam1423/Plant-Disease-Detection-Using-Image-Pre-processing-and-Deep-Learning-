clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;
    rgbImage = imread('C:\Users\Shivam\Desktop\crowdai\c_0\3f65aa69-06c9-423f-ac7a-e2ab6edf63ca___FREC_Scab 3360.jpg');
    grayImage=rgb2gray(rgbImage);
    % Get the dimensions of the image.  numberOfColorBands should be = 3.
    [rows columns numberOfColorBands] = size(rgbImage);
    % Display the original color image.
    subplot(2, 2, 1);
    imshow(rgbImage, []);
    title('Original color Image', 'FontSize', fontSize)
    % Enlarge figure to full screen.
    set(gcf, 'Position', get(0,'Screensize')); 
    % Extract the individual red, green, and blue color channels.
    maxValue = intmax(class(rgbImage))
    redChannel = rgbImage(:, :, 1);
    greenChannel = rgbImage(:, :, 2);
    blueChannel = rgbImage(:, :, 3);
    spots = greenChannel < 80;
    img = rgb2gray(rgbImage);
    sensivity = 0.16
    %sensivity = T_Low+step_size;
    BWImage = edge(img,'canny',sensivity);
    subplot(2, 2, 2);
    imshow(BWImage);
    title('edge detection', 'FontSize', fontSize);
    spots = spots-(BWImage-(spots));
    subplot(2, 2, 3);
    imshow(spots, []);
    title('spots detection', 'FontSize', fontSize);
    spots =  imfilter(grayImage, fspecial('log',31,5));
    subplot(2, 2, 4);
    imshow(spots, []);
    title('spots segmentation', 'FontSize', fontSize)