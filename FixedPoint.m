% 不定点迭代法求解非线性方程
function [r,n] = FixedPoint(f, x0, eps)
% f为迭代函数
% x0为迭代的初值
% eps为解的精度
% r为方程的解
% n为迭代步数
n = 1;
tol = 1;
x(1) = x0;
k = 1;
while tol > eps
    x(k+1) = f(x(k));
    tol = abs(x(k)-x(k+1));
    n = n+1;
    k = k+1;
    if(n>10000)       %控制迭代步数
        disp('迭代步数太多，可能不收敛!');
        return;
    end
end
r = x(k);

