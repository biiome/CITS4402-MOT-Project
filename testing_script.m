%% Initial Setup
clear; clc;

fileLocation = 'C:\Users\pc\OneDrive - The University of Western Australia\Uni\2022\Computer Vision\Project\VISO\mot\car\001';
nameTemplate = '%06d';
frameRange = [10 80];

%% Generatre initial data
p1 = parser(fileLocation, nameTemplate, frameRange)

%% Extract single frame and display it
p2 = p1.file_index(53)
imshow(p2.frame);
% hold on;
% rectangle('Position', [582,24,6,9],'FaceColor',[0 .5 .5])

%% Load csv data
p3 = p2.read_csv()

%% Small Object Detector
% Loading first frame in the image
a = frameRange(1);
b = a + 1;
c = b + 1;

% Load images required
a_img = p1.file_index(a).frame;
b_img = p1.file_index(b).frame;
c_img = p1.file_index(c).frame;

% Convert images to greyscale
a_img_bw = rgb2gray(a_img);
b_img_bw = rgb2gray(b_img);
c_img_bw = rgb2gray(c_img);

% Pull out a 30x30 pixel frame
x_pixels_range = 1:30;
y_pixels_range = 1:30;
a_local = a_img_bw(x_pixels_range, y_pixels_range);
b_local = b_img_bw(x_pixels_range, y_pixels_range);
c_local = c_img_bw(x_pixels_range, y_pixels_range);
% figure, imshow(a_local);
% figure, imshow(b_local);
% figure, imshow(c_local);


% Difference between a and b
ab = imabsdiff(a_local,b_local);
% figure, imshow(ab);
% figure, ab_hist = histogram(ab);

% Difference between b and c
bc = imabsdiff(b_local,c_local);
% figure, imshow(bc);
% figure, bc_hist = histogram(bc);

% Calculate mean of absolute differences
ab_avg = mean(ab(:));
bc_avg = mean(bc(:));

% Thresholding
lambda_ab = 1/ab_avg;
threshold_ab = (-log(0.05))/lambda_ab;

lambda_bc = 1/bc_avg;
threshold_bc = (-log(0.05))/lambda_bc;

% Binarisation
ab_bin = ab > threshold_ab;
bc_bin = bc > threshold_bc;


