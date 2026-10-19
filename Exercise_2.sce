// Exercise 2
function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    //Ve tin hieu goc va tin hieu tre
    scf(0); 
    clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, -4);
    xtitle('Original Signal x(n)', 'n', 'x(n)');
    xgrid();
    subplot(2, 1, 2);
    plot2d3(ny, yn, -4);
    xtitle('Advanced Signal y(n) = x(n + k) (k > 0)', 'n', 'y(n)');
    xgrid();
    
endfunction
// Testing 
xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;
//Call Advance Function
[yn, yorigin] = advance(xn, xorigin, k);
//Print out the result
mprintf('Exercise 2 result:\n');
disp(yn, 'yn = ');
mprintf('yorigin = %d\n', yorigin);
