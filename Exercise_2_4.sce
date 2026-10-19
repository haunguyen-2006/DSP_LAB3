// ======================================================
// EXERCISE 2.4 - EVEN / ODD SIGNAL DECOMPOSITION
// ======================================================
clear;
clc;

function drawSig(nr, nc, pos, n, v, txt)
    subplot(nr, nc, pos);
    plot2d3(n, v, -5);
    plot(n, v, 'bo');
    title(txt);
    xlabel('n');
    ylabel('Amplitude');
    xgrid(1);
endfunction

// Given x[n] = {2, 3, 4, 5, 6}, with the origin under 4
n = -2:2;
x = [2, 3, 4, 5, 6];

// x[-n] is obtained by reversing the sample order
x_fold = x($:-1:1);

// Even and odd components
x_even = 0.5 * (x + x_fold);
x_odd  = 0.5 * (x - x_fold);

scf(1);
clf();
drawSig(3, 1, 1, n, x, 'Exercise 2.4: Original x[n]');
drawSig(3, 1, 2, n, x_even, 'Even component x_e[n]');
drawSig(3, 1, 3, n, x_odd, 'Odd component x_o[n]');

// Verify the decomposition and symmetry properties
mprintf('Reconstruction error = %g\n', max(abs(x - x_even - x_odd)));
mprintf('Even symmetry error = %g\n', max(abs(x_even - x_even($:-1:1))));
mprintf('Odd symmetry error = %g\n', max(abs(x_odd + x_odd($:-1:1))));
