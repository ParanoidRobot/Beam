w = 100e-6;
lambda = 580e-9;
n = 1;
z = pi * w^2 * n / lambda;

d2p = 1436e-3;
f3 = 150e-3;
f2 = 100e-3;
f1 = 30e-3;
d1p = f2^2 / (z^2 + (d2p - f2)^2) * (d2p - f2) + f2;

% L = 307.3e-3;
% d2 = L - d1p;
% d1 = f1^2 / (z^2 + (d2 - f1)^2) * (d2 - f1) + f1;
wL = sqrt((d1p - f2)/(d2p - f2)) * w;

w0 = 25e-6;
z0 = pi * w0^2 * n / lambda;
d1 = f1 + sqrt((w0 * f1 / wL)^2 - z0^2);
% d1 = 0.06;
d2 = f1 + wL^2 / w0^2 * (d1 - f1);
L = d2 + d1p;

zL = pi * wL^2 * n / lambda;
w1 = w0 * sqrt(1 + (d1 / z0)^2);
w2 = wL * sqrt(1 + (d1p / zL)^2);
w3 = w * sqrt(1 + (f3 / z)^2);


% syms d1 d2 L
% eqns = [d1 == f1^2 / (z^2 + (d2 - f1)^2) * (d2 - f1) + f1,...
%     d1 == f1 + sqrt((w0 * f1 / wL)^2 - z0^2),...
%     d2 == L - d1p];
% S = vpa(solve(eqns, [d1 d2 L]))

% L = 300e-3;
% syms d
% eqns = [d == L - 100];
% S = vpa(solve(eqns, [d]))