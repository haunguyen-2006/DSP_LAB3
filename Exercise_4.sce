// Exercise 4
function [yn, yorigin]=add(x1n, x1origin, x2n, x2origin)
    //Determine time axis for each input signal
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    //Determine combined time range for the output signal
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    //Origin position of y(n)
    yorigin = 1 - n_min;
    //Initialize zero vectors with the length of ny
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    //Place x1 and x2 into their corresponding time positions
    idx1_start = min(n1) - n_min + 1;
    idx1_end   = max(n1) - n_min + 1;
    y1(idx1_start : idx1_end) = x1n;
    
    idx2_start = min(n2) - n_min + 1;
    idx2_end   = max(n2) - n_min + 1;
    y2(idx2_start : idx2_end) = x2n;
    //Perform addition
    yn = y1 + y2;
    //Draw plot
    scf(0);
    clf();
    //Plot x1(n)
    subplot(3, 1, 1);
    plot2d3(n1, x1n, -4);
    xtitle('Signal x1(n)', 'n', 'x1(n)');
    xgrid();
    //Plot x2(n)
    subplot(3, 1, 2);
    plot2d3(n2, x2n, -4);
    xtitle('Signal x2(n)', 'n', 'x2(n)');
    xgrid();
    //Plot y(n) = x1(n) + x2(n)
    subplot(3, 1, 3);
    plot2d3(ny, yn, -4);
    xtitle('Output Signal y(n) = x1(n) + x2(n)', 'n', 'y(n)');
    xgrid();
    
endfunction

//Testing
x1n = [0, 1, 3, -2];
x1origin = 1;
x2n = [2, 1, 2, 3];
x2origin = 2;
//Call add function
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
// Print out the result
mprintf('Exercise 4 result:\n');
disp(yn, 'yn = ');
mprintf('yorigin = %d\n', yorigin);
