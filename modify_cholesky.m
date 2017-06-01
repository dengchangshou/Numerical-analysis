% 改进平方根分解法解线性方程
function x = m_chol(A,b)
n = length(A);
L = eye(n);
D = zeros(n);
d = zeros(1,n);
T = zeros(n);
for k = 1:n
    d(k) = A(k,k);
    for j = 1:k-1
        d(k) = d(k) - L(k,j)*T(k,j);
    end
    for i = k+1:n
        T(i,k) = A(i,k);
        for j = 1:k-1
            T(i,k) = T(i,k) - T(i,j)*L(k,j);
        end
        L(i,k) = T(i,k)/d(k);
    end
end
D = diag(d);
L
D
x = zeros(n,1);
y = zeros(n,1);
dl = zeros(n,1);
dl = diag(D);
y(1) = b(1);
for i = 2:n
    ly = 0;
    for k = 1:i-1
        ly = ly+L(i,k)*y(k);
    end
    y(i) = b(i) - ly;
end
x(n) = y(n)/dl(n);
for i = n-1:-1:1
    lx = 0;
    for k = i+1:n
        lx = lx+L(k,i)*x(k);
    end
    x(i) = y(i)/dl(i)-lx;
end
y