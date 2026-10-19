// ======================================================
// EXERCISE 2.1 - DISCRETE-TIME SIGNAL OPERATIONS
// ======================================================
clear;
clc;

function y = x21sig(n)
    y = (1 + n/3) .* bool2s((n >= -3) & (n <= -1)) ...
        + bool2s((n >= 0) & (n <= 3));
endfunction

function drawSig(nr, nc, pos, n, v, txt)
    subplot(nr, nc, pos);
    plot2d3(n, v, -5);
    plot(n, v, 'bo');
    title(txt);
    xlabel('n');
    ylabel('Amplitude');
    xgrid(1);
endfunction

// Sample range for all plots
n = -8:8;

// (a) Original signal x[n]
x = x21sig(n);

// (b1) Fold x[n], then delay by 4 samples: x[4-n]
y_fold_delay = x21sig(4 - n);

// (b2) Delay x[n] by 4 samples, then fold: x[-n-4]
y_delay_fold = x21sig(-n - 4);

// (c) x[-n+4] is identical to part (b1)
y_c = x21sig(-n + 4);

// (e) x[n] expressed with delta and unit-step signals
x_decomp = (1/3) * bool2s(n == -2) ...
         + (2/3) * bool2s(n == -1) ...
         + bool2s((n >= 0) & (n <= 3));

scf(1);
clf();
drawSig(2, 2, 1, n, x, 'Exercise 2.1(a): Original x[n]');
drawSig(2, 2, 2, n, y_fold_delay, 'Exercise 2.1(b1,c): x[4-n]');
drawSig(2, 2, 3, n, y_delay_fold, 'Exercise 2.1(b2): x[-n-4]');
drawSig(2, 2, 4, n, x_decomp, 'Exercise 2.1(e): Delta-step reconstruction');

// Numerical checks
mprintf('Exercise 2.1: max reconstruction error = %g\n', max(abs(x - x_decomp)));
