// ======================================================
// EXERCISE 2.6 - TIME-INVARIANCE TESTS
// ======================================================
clear;
clc;

function y = x26sig(n)
    y = bool2s((n >= 0) & (n <= 3));
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

// Input specified by the exercise: x[n] = 1 for 0 <= n <= 3
n = -5:8;
x = x26sig(n);

// ------------------------------------------------------
// (a) System T{x[n]} = x[n^2]
// Time-varyance is checked in (b) with the given input.
// ------------------------------------------------------
y_a = x26sig(n .^ 2);

// ------------------------------------------------------
// (b) Compare T{x[n]} shifted by 2 with T{x[n-2]}
// ------------------------------------------------------
// Original output y[n] = x[n^2]
y_b = x26sig(n .^ 2);

// Shift output by two samples: y[n-2] = x[(n-2)^2]
y_b_shift_output = x26sig((n - 2) .^ 2);

// Shift input by two samples: x2[n] = x[n-2]
x_b_shift_input = x26sig(n - 2);

// Apply T to shifted input: T{x2[n]} = x2[n^2] = x[n^2-2]
y_b_system_shifted_input = x26sig(n .^ 2 - 2);

diff_b = y_b_shift_output - y_b_system_shifted_input;

scf(1);
clf();
drawSig(2, 3, 1, n, x, '2.6(b): Input x[n]');
drawSig(2, 3, 2, n, y_b, 'Original output y[n]=x[n^2]');
drawSig(2, 3, 3, n, y_b_shift_output, 'Shifted output y[n-2]');
drawSig(2, 3, 4, n, x_b_shift_input, 'Shifted input x[n-2]');
drawSig(2, 3, 5, n, y_b_system_shifted_input, 'T applied to shifted input');
drawSig(2, 3, 6, n, diff_b, 'Difference: output shift - shifted-input output');

// ------------------------------------------------------
// (c) System T{x[n]} = x[n] - x[n-1]
// ------------------------------------------------------
y_c = x26sig(n) - x26sig(n - 1);
y_c_shift_output = x26sig(n - 2) - x26sig(n - 3);
x_c_shift_input = x26sig(n - 2);
y_c_system_shifted_input = x_c_shift_input - x26sig(n - 3);
diff_c = y_c_shift_output - y_c_system_shifted_input;

scf(2);
clf();
drawSig(2, 3, 1, n, x, '2.6(c): Input x[n]');
drawSig(2, 3, 2, n, y_c, 'Output y[n]=x[n]-x[n-1]');
drawSig(2, 3, 3, n, y_c_shift_output, 'Shifted output y[n-2]');
drawSig(2, 3, 4, n, x_c_shift_input, 'Shifted input x[n-2]');
drawSig(2, 3, 5, n, y_c_system_shifted_input, 'T applied to shifted input');
drawSig(2, 3, 6, n, diff_c, 'Difference (should be all zero)');

// ------------------------------------------------------
// (d) System T{x[n]} = n*x[n]
// ------------------------------------------------------
y_d = n .* x26sig(n);

// Shift original output by two samples: (n-2)*x[n-2]
y_d_shift_output = (n - 2) .* x26sig(n - 2);

// Apply system to shifted input: n*x[n-2]
x_d_shift_input = x26sig(n - 2);
y_d_system_shifted_input = n .* x_d_shift_input;

diff_d = y_d_shift_output - y_d_system_shifted_input;

scf(3);
clf();
drawSig(2, 3, 1, n, x, '2.6(d): Input x[n]');
drawSig(2, 3, 2, n, y_d, 'Output y[n]=n*x[n]');
drawSig(2, 3, 3, n, y_d_shift_output, 'Shifted output y[n-2]');
drawSig(2, 3, 4, n, x_d_shift_input, 'Shifted input x[n-2]');
drawSig(2, 3, 5, n, y_d_system_shifted_input, 'T applied to shifted input');
drawSig(2, 3, 6, n, diff_d, 'Difference: output shift - shifted-input output');

mprintf('Exercise 2.6(c) TI check: max difference = %g\n', max(abs(diff_c)));
mprintf('Exercise 2.6(b) time-varying check: max difference = %g\n', max(abs(diff_b)));
mprintf('Exercise 2.6(d) time-varying check: max difference = %g\n', max(abs(diff_d)));
