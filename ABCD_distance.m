L = 2;
% syms L
w0 = 400e-6;
w = 150e-6;
lambda = 580e-9;
n = 1;
q0 = 1i * pi * w0^2 * n / lambda;
f1 = 150e-3;
f2 = 125e-3;
f3 = 150e-3;

d2 = f1 + f2;
d4 = 145e-3;
syms d1 d3 real
% M = [1,0;-1/c,1]*[1,c;0,1]*[1,0;-1/b,1]*[1,b;0,1]*[1,0;-1/a,1]*[1,a-L;0,1];
M = [1,d4;0,1]*[1,0;-1/f3,1]*[1,d3;0,1]*[1,0;-1/f2,1]*[1,d2;0,1]*...
    [1,0;-1/f1,1]*[1,d1-L;0,1];
q = (M(1,1) * q0 + M(1,2)) / (M(2,1) * q0 + M(2,2));

eqns = [vpa(imag(1/q)) == vpa(-lambda / (pi * w^2)), d1 + d2 + d3 + d4 == 2]
solution = vpasolve(eqns, [d1 d3]);
disp(solution.d1);
disp(solution.d3);

% vpasolve([ (3*pi*((20*a)/9 + 20*c - 59/9))/(5800*((a/3 + 3*c - 8/15)^2 ...
% + (9*pi^2)/33640000)) - (pi*(a/3 + 3*c - 8/15))/(290*((a/3 + 3*c - ...
% 8/15)^2 + (9*pi^2)/33640000)) == -2598291766210267/140737488355328, a + c + 1/5 == 19/10],[a c])
 