% Vittorio Longi
% CS 559 - Computer Vision
% Gradient calculator using Sobel kernels

clear all
clc

h_x = [ -1 0 1; -2 0 2; -1 0 1 ];
h_y = [ -1 -2 -1; 0 0 0; 1 2 1 ];


f =   [ 2   2   2   2   2   2   2   2;
        2   2   2   2   2   2   2   7;
        2   2   2   2   2   2   7   7;
        2   2   2   2   2   7   7   7;
        2   2   2   2   7   7   7   7;
        2   2   2   7   7   7   7   7;
        2   2   7   7   7   7   7   7;
        2   7   7   7   7   7   7   7];
    
g_x = zeros(size(f)-2);     % gradients in x-direction
g_y = zeros(size(f)-2);     % gradients in y-direction
g = zeros(size(g_x));       % gradient magnitudes

% Loop through each pixel
for xdir = 2 : (size(f)-1)
    for ydir = 2 : (size(f)-1)
        % Loop through kernel elements
        for j = 1:3
            for k = 1:3
                g_x(xdir-1, ydir-1) = g_x(xdir-1, ydir-1) ...
                    + h_x(j,k) * f(xdir-(2-j), ydir-(2-k));
                g_y(xdir-1, ydir-1) = g_y(xdir-1, ydir-1) ...
                    + h_y(j,k) * f(xdir-(2-j), ydir-(2-k));
            end
        end
    end
end

% Calculate magnitudes
for xdir = 1 : (size(f)-2)
    for ydir = 1 : (size(f)-2)
        g(xdir, ydir) = round(sqrt(g_x(xdir,ydir)^2 + g_y(xdir,ydir)^2));
    end
end
