// Exercise 3
function [yn, yorigin] = fold(xn, xorigin)
    //Reverse the signal values vector
    yn = xn($:-1:1); 
    //Compute new origin position
    yorigin = length(xn) - xorigin + 1;
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    //Draw plots
    scf(0); 
    clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, -9);
    xtitle('Original Signal x(n)', 'n', 'x(n)');
    xgrid();
    subplot(2, 1, 2);
    plot2d3(ny, yn, -9);
    xtitle('Folded Signal y(n) = x(-n)', 'n', 'y(n)');
    xgrid();
    
endfunction
// Testing
xn = [1, -2, 3, 6];
xorigin = 3;
//Call Fold Function
[yn, yorigin] = fold(xn, xorigin);
//Print out the result
mprintf('Exercise 3 result:\n');
disp(yn, 'yn = ');
mprintf('yorigin = %d\n', yorigin);
