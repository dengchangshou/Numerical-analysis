% jacobi迭代求解线性方程
function [k,X] = jacobi(A,B,P,delta,max1)
% Jacobi iteration method for linear system AX=B
% A - N by N nonsingular matrix
% B - N by 1 matrix
% P - N by 1 matrix, initial guess
% delta - tolerance for P
% max1 - maximum number of iterations
% X - N by 1 matrix, jacobi approximation to the solution AX=B
% A是n维非奇异阵 
% B是n维向量 
% P是初值 
% delta是误差界 
% max1是迭代次数
% X为所求的方程组AX=B的近似解 
N = length(B);
for k = 1:max1,
    for j = 1:N,
        X(j) = (B(j)-A(j,[1:j-1,j+1:N])*P([1:j-1,j+1:N]))/A(j,j);
    end
    err = abs(norm(X'-P));
    relerr = err/(norm(X)+eps);
    P = X';
    if(err<delta)|(relerr<delta),
        break
    end
end
    X = X';