clc; clear;

function [y_hat, theta_hat] = cubic_regression (x, y); //function calculates values for a row vector consisting of variables: y_hat and theta_hat
    X=[x.^3, x.^2, x, ones(x)]; //Vector X is created with 4 vectors, so basically it is a matrix. Each element of the to vectors is taken to the power of 3 or 2. that is why the dot is used in front of the power sign (^) is used. (elementwise).
    theta_hat = inv(X'*X)*X'*y; //theta_hat is calculated, inverse function is used
    y_hat = X*inv(X'*X)*X'*y; //y_hat is calculated
endfunction

x=[0:4]'; //1x5 vector x is created with values from 0 to 4  
y=[1, 0, 3, 5, 8]'; // 1x5 vector y is created
[y_hat, theta_hat]=cubic_regression(x,y); //function cubic_regression is called with vectors x and y, with values assigned above
scf(0); //figure one is selected
clf(); //selected figure is emptied
plot(x,y, "ro"); //x against y is plotted with red dots as output
plot(x, y_hat);     // it was assumed that the task is to compare the plot of true                          // values and the regression line
xgrid(1); //grid is included in the figure
title("Cubic regression"); //title is specified
xlabel("x value"); //x axis is labeled
ylabel("true and approximated ys"); //y axis is labeled
legend(['y'; 'y_hat (function U)'], [2]); //the legend is drawn in the upper left-hand corner for  y (red dots )and y_hat (blue line)
