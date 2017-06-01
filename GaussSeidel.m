% 高斯赛德尔迭代求解线性方程
function [x,n] = GaussSeidel(A,b,x0,eps,M)
% A为线性方程组的系数矩阵
% b为线性方程组的常量矩阵
% x0是迭代的初值
% eps是迭代的精度控制
% M是迭代步数控制
% x为线性方程组的解
% n为实际的迭代步数
if nargin == 3
    eps = 1.0e-6;
    M = 200;
elseif nargin == 4
    M = 200;
elseif nargin <3
    error
    return;
end
D = diag(diag(A));    % 求A的对角矩阵
L = -tril(A,-1);      % 求A的下三角阵
U = -triu(A,1);       % 求A的上三角阵
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;                  % 迭代次数
while norm(x-x0) >= eps
    x0 = x;
    x = G*x0+f;
    n = n+1;
    if(n >= M)
        disp('Warning:迭代次数太多，可能不收敛!');
        return;
    end
end
