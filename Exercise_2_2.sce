// ======================================================
// EXERCISE 2.2 - DISCRETE-TIME SIGNAL TRANSFORMATIONS
// ======================================================
clear;
clc;

function y = x22sig(n)
    y = bool2s((n >= -1) & (n <= 2)) ...
        + 0.5 * bool2s((n >= 3) & (n <= 4));
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

n = -5:8;
x = x22sig(n);

// (a) Time shift: x[n-2]
y_a = x22sig(n - 2);

// (b) Folding and shift: x[4-n]
y_b = x22sig(4 - n);

// (c) Advance: x[n+2]
y_c = x22sig(n + 2);

// (d) Multiplication by u[2-n]
y_d = x22sig(n) .* bool2s(n <= 2);

// (e) Multiplication by delta[n-3]
// x[n-1] delta[n-3] = x[2] delta[n-3] = delta[n-3]
y_e = x22sig(n - 1) .* bool2s(n == 3);

// (f) Nonlinear index transformation: x[n^2]
y_f = x22sig(n .^ 2);

// (g) Even component, and (h) odd component
x_even = 0.5 * (x22sig(n) + x22sig(-n));
x_odd  = 0.5 * (x22sig(n) - x22sig(-n));

scf(1);
clf();
drawSig(4, 2, 1, n, x, 'Exercise 2.2: Original x[n]');
drawSig(4, 2, 2, n, y_a, '2.2(a): x[n-2]');
drawSig(4, 2, 3, n, y_b, '2.2(b): x[4-n]');
drawSig(4, 2, 4, n, y_c, '2.2(c): x[n+2]');
drawSig(4, 2, 5, n, y_d, '2.2(d): x[n]u[2-n]');
drawSig(4, 2, 6, n, y_e, '2.2(e): x[n-1]delta[n-3]');
drawSig(4, 2, 7, n, y_f, '2.2(f): x[n^2]');
drawSig(4, 2, 8, n, x_even, '2.2(g): Even component x_e[n]');

// A separate figure makes the odd component easier to inspect.
scf(2);
clf();
drawSig(1, 1, 1, n, x_odd, 'Exercise 2.2(h): Odd component x_o[n]');

mprintf('Exercise 2.2 complete. Even/odd check max error = %g\n', ...
    max(abs(x - x_even - x_odd)));
