// Exercise 6
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    //Using SciLab's built-in function to perform discrete convolution
    yn = convol(xn, hn);
    //Compute the origin position of y(n)
    yorigin = xorigin + horigin - 1;
    //Generate time axes for all signals
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    //Draw Plots
    scf(0);
    clf();
    //x(n)
    subplot(3, 1, 1);
    plot2d3(nx, xn, -4);
    xtitle('Input Signal x(n)', 'n', 'x(n)');
    xgrid();
    //h(n)
    subplot(3, 1, 2);
    plot2d3(nh, hn, -4);
    xtitle('Impulse Response h(n)', 'n', 'h(n)');
    xgrid();
    //y(n) = x(n) * h(n)
    subplot(3, 1, 3);
    plot2d3(ny, yn, -4);
    xtitle('Convolution Output y(n) = x(n) * h(n)', 'n', 'y(n)');
    xgrid();
endfunction

// Testing
xn = [1, 2, 3];
xorigin = 1;
hn = [1, 1];
horigin = 1;
//Call convolution function
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);
//Print result
mprintf('Exercise 6 result:\n');
disp(yn, 'yn = ');
mprintf('yorigin = %d\n', yorigin);
